# -*- coding: utf-8 -*-
# Generated by Django 1.9.11 on 2017-01-08 10:57
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chatOL', '0006_auto_20170108_1845'),
    ]

    operations = [
        migrations.AlterField(
            model_name='message',
            name='timestamp',
            field=models.DateTimeField(db_index=True, default=datetime.datetime(2017, 1, 8, 18, 57, 51, 781757)),
        ),
    ]
