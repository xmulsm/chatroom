import re
import json
import logging

import datetime
from channels import Group
from channels.sessions import channel_session
from .models import ChatRoom, ChatLog,Message,Room
from apscheduler.schedulers.background import BackgroundScheduler
from django.utils import timezone
import time

log = logging.getLogger(__name__)
@channel_session
def ws_connect(message):
    # Extract the room from the message. This expects message.path to be of the
    # form /chat/{label}/, and finds a Room if the message path is applicable,
    # and if the Room exists. Otherwise, bails (meaning this is a some othersort
    # of websocket). So, this is effectively a version of _get_object_or_404.
    try:
        prefix, label = message['path'].strip('/').split('/')
        if prefix != 'chat':
            log.debug('invalid ws path=%s', message['path'])
            return
        room = Room.objects.get(label='default')
    except ValueError:
        log.debug('invalid ws path=%s', message['path'])
        return
    except ChatRoom.DoesNotExist:
        log.debug('ws room does not exist label=%s', label)
        return

    print('chat connect room={} client={}:{}'.format(room.label, message['client'][0], message['client'][1]))

    # Need to be explicit about the channel layer so that testability works
    # This may be a FIXME?
    # print('label='+label)
    Group('chat-' + 'chatroom', channel_layer=message.channel_layer).add(message.reply_channel)
    # timestamp=timezone.now().strftime('%m-%d %H:%M:%S')
    # data = {'handle': '系统管理员', 'message': '欢迎您的到来！','timestamp':timestamp}
    # Group('chat-' + 'chatroom').send({'text':json.dumps(data)})

    message.channel_session['room'] = room.label


@channel_session
def ws_receive(message):
    # Look up the room from the channel session, bailing if it doesn't exist
    try:
        label = message.channel_session['room']
        room = Room.objects.get(label='default')
        print(room)
    except KeyError:
        log.debug('no room in channel_session')
        return
    except ChatRoom.DoesNotExist:
        print('recieved message, buy room does not exist label=%s', label)
        return

    # Parse out a chat message from the content text, bailing if it doesn't
    # conform to the expected message format.
    try:
        data = json.loads(message['text'])
    except ValueError:
        log.debug("ws message isn't json text=%s", message['text'])
        return

    if set(data.keys()) != set(('handle', 'message')):
        print("ws message unexpected format data=%s", data)
        return

    if data:
        print('chat message room={} handle={} message={}'.format(room.label, data['handle'], data['message']))
        m = room.messages.create(**data)

        # See above for the note about Group
        # print('recive:'+label)
        Group('chat-' + 'chatroom',channel_layer=message.channel_layer).send({'text': json.dumps(m.as_dict())})



@channel_session
def ws_disconnect(message):
    try:
        label = message.channel_session['room']
        room = Room.objects.get(label=label)
        Group('chat-' + label, channel_layer=message.channel_layer).discard(message.reply_channel)
    except (KeyError, Room.DoesNotExist):
        pass


def auto_msg(room):
    # rooms = Room.objects.all()
    # for room in rooms:
    #     Message.objects.create(room_id=room.id, handle='系统管理员', message='这是系统管理员发送的信息！')
    # data={'room_id':room.id, 'handle':'系统管理员', 'message':'这是系统管理员发送的信息！'}

    m = room.messages.create(handle='系统管理员', message='这是系统管理员发送的信息！',timestamp=datetime.datetime.now())
    # Group('chat-' + label, channel_layer=message.channel_layer).send({'text': json.dumps(m.as_dict())})
    Group('chat-' + 'chatroom').send({'text': json.dumps(m.as_dict())})


# 系统管理员定时群发信息
sched = BackgroundScheduler()
sched.add_job(auto_msg, 'cron', minute='*/3', hour='*', kwargs={'room': Room.objects.get(label='default')})
sched.start()