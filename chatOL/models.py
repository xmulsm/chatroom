# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone
import datetime

class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class ChatLog(models.Model):
    msg_id = models.AutoField(unique=True,primary_key=True)
    from_user = models.ForeignKey('UserProfile', models.DO_NOTHING)
    chat_content = models.CharField(max_length=512, blank=True, null=True)
    msg_type = models.ForeignKey('MsgType', models.DO_NOTHING)
    state_time = models.DateTimeField(blank=True, null=True)
    chat_room = models.ForeignKey('ChatRoom', related_name='message')
    to_user = models.ForeignKey('UserProfile', models.DO_NOTHING,related_name='toUser')
    create_time = models.DateTimeField(blank=True, null=True,default=timezone.now)

    class Meta:
        managed = False
        db_table = 'chat_log'
        unique_together = (('msg_id', 'from_user', 'msg_type', 'chat_room', 'to_user'),)

    def as_dict(self):
        return {'handle': self.from_user, 'message': self.chat_content, 'timestamp': self.create_time}


class ChatRoom(models.Model):
    chat_room_id = models.AutoField(primary_key=True)
    chat_room_name = models.CharField(max_length=45, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'chat_room'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class MsgType(models.Model):
    msg_type_id = models.AutoField(primary_key=True)
    msg_type = models.CharField(max_length=45, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'msg_type'


class UserProfile(User):
    # user_id = models.AutoField(primary_key=True)
    user=models.OneToOneField(User)
    user_nickname = models.CharField(unique=True, max_length=45)
    user_username = models.CharField(unique=True, max_length=45)
    user_password = models.CharField(max_length=45)
    user_avatar = models.CharField(max_length=45, blank=True, null=True)
    user_invitecode = models.CharField(max_length=45, blank=True, null=True)
    user_createtime = models.DateTimeField(blank=True, null=True)
    user_pwd_try_times = models.IntegerField(blank=True, null=True,default=0)
    user_islocked = models.BooleanField(blank=True, default=False)
    user_login_ip = models.CharField(max_length=45, blank=True, null=True)
    user_login_times = models.IntegerField(blank=True, null=True,default=0)
    user_last_logintime = models.DateTimeField(blank=True, null=True)
    user_my_invite_code=models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'user_profile'

class Room(models.Model):
    name = models.TextField()
    label = models.SlugField(unique=True)

    def __unicode__(self):
        return self.label

class Message(models.Model):
    room = models.ForeignKey(Room, related_name='messages')
    handle = models.TextField()
    message = models.TextField()
    # timestamp = models.DateTimeField(default=datetime.datetime.now, db_index=True)
    timestamp = models.DateTimeField(auto_now_add=True,db_index=True)

    def __unicode__(self):
        return '[{timestamp}] {handle}: {message}'.format(**self.as_dict())

    @property
    def formatted_timestamp(self):
        return self.timestamp.strftime('%m-%d %H:%M:%S')
        # return self.timestamp.strftime('%b %-d %-I:%M %p')

    def as_dict(self):
        return {'handle': self.handle, 'message': self.message, 'timestamp': self.formatted_timestamp}
