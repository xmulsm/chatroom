from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.shortcuts import render,render_to_response,HttpResponse,HttpResponseRedirect
import hashlib
import random
import string

from .models import UserProfile
# Create your views here.
import time
from datetime import datetime
import shortuuid
from .models import ChatLog,ChatRoom,UserProfile,Room
from django.utils.safestring import SafeString

def genInviteCode(length=6, chars= string.ascii_letters+string.digits):
        yield ''.join([random.choice(chars) for i in range(length)])

def coupon_gen():
    '''
    生成邀请码
    :return:
    '''
    line1=list()
    for i in range(100):
        for item in genInviteCode():
            line1.append(item)
    line2=list(set(line1))
    return random.choice(line2)

def index(req):
    return render(req,'register.html')

def register(req):
    '''
    用户注册
    :param req:
    :return:
    '''

    if 'POST'==req.method:
        invite_code = req.POST["inviteCode"]
        nickname = req.POST['nickname']
        password = req.POST['password']
        username=req.POST['username']
        is_username=UserProfile.objects.filter(user_username__exact=username)
        is_nickname=UserProfile.objects.filter(user_nickname__exact=nickname)
        #如果用户表中存在用户名或者用户昵称则提示用户已注册
        if is_nickname or is_username:
            msg='用户已存在，请直接登录，或者检测用户名、昵称！'
            return HttpResponse('error')
        else:
            current_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
            my_invite_code=coupon_gen()
            user_id=int(len(UserProfile.objects.all()))+1
            UserProfile.objects.create(username=username,password=password,user_username=username,user_password=password,user_invitecode=invite_code,user_nickname=nickname,user_createtime=current_time,user_my_invite_code=my_invite_code)
            # user.save()
            msg='注册成功,请登录！'
            result={'msg':msg}
            # return  render_to_response('register.html',result)
            return HttpResponse('success')

def login(req):
    '''
    用户登录
    :param req:
    :return:
    '''
    # 定义登录验证返回信息码
    result_code=0
    if 'POST'==req.method:
        MAX_WRONG_PWD_NUMS = 5  # 最大的可重试次数
        username = req.POST['username']
        password = req.POST['password']
        try:
            try_user=UserProfile.objects.get(user_username__exact=username)
            is_locked = try_user.user_islocked
            if try_user.user_password == password and not is_locked:
                login_user = UserProfile.objects.get(user_username__exact=username)
                current_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
                login_user.user_login_times+=1   #登录次数加1
                login_user.user_last_logintime=current_time
                # req.session['user'] = username
                # 获取用户ip
                try:
                    real_ip = req.META['HTTP_X_FORWARDED_FOR']
                    ip = real_ip.split(",")[0]
                except:
                    try:
                        ip = req.META['REMOTE_ADDR']
                    except:
                        ip = ""
                login_user.user_pwd_try_times = 0
                login_user.user_login_ip = ip
                login_user.save()
                result_code = 0
                UserProfile.backend = 'django.contrib.auth.backends.ModelBackend'
                req.session['username'] = username
                req.session.set_expiry(60 * 30)
                auth.login(req,login_user)
                return HttpResponse(result_code)
            elif is_locked:
                result_code = 2  # 用户存在但是已被锁定
                return HttpResponse(result_code)
            elif try_user.user_password != password:
                result_code = 3  # 密码错误
                try_user.user_pwd_try_times += 1
                if try_user.user_pwd_try_times <= MAX_WRONG_PWD_NUMS:
                    try_user.user_islocked = 0
                else:
                    try_user.user_islocked = 1  # 超过最大密码尝试次数则锁定用户
                try_user.save()
                return HttpResponse(result_code)

        except UserProfile.DoesNotExist:
            result_code = 1  # 用户不存在
            return HttpResponse(result_code)
    else:
        return render(req, 'register.html')

@login_required
def chat(req):
    '''
    聊天室入口
    :param req:  请求
    :param label: 房间名称
    :return:
    '''
    username=req.session.get('username')
    try:
        room, created=Room.objects.get_or_create(label='default')
        messages=reversed(room.messages.order_by('-timestamp')[:50])

        return render_to_response('group_chat.html', {'username': SafeString(username),
                                                      'room':room,
                                                      'messages':messages})
    except Room.DoesNotExist:
        return HttpResponseRedirect('/logout/')

def logout(req):
    '''
    退出登录
    :param req:
    :return:
    '''
    auth.logout(req)
    return HttpResponseRedirect('/accounts/login/')










