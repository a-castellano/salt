#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Daedalus():

    MAZE_NAME = 'windcluster'

    ### AUTH

    SSH_AUTH = {
        'root': [
                  'AAAAB3NzaC1yc2EAAAADAQABAAABAQCoDeg52mYgYidGli6nqEDMlb6mZQlDV10EY6Y9twnFwAddcbs0YtFnVs045WVpxWWS42Sm9FPC/PYv9aNDuB+7RO6THAiAYpj4VsElm2Xkt21PiIrd2GBwMIvN25FDhAYTzpXCGabEKviKZx7vx5j/huzDvdom5DUfLtCjTH9XydJsakspM2UZDhrnc8+R1yZV+TCXjy9l/w1kkplkziwpLadzVUzhSQmPqAMkgVVnT7kw2FmDe8PJTZNB/gMmCSUS+ONULu2XrR4/ExnORf2CyHcr234TZAIUhjOta66UPjFIapoXrZFhnpjOZTnSd5BPTVINDt4fkutytDw4pe7x'
                 ]
    }

    ### WEB

    WEB_SERVER = 'nginx'
    WEB_USERS = ['windmaker']
    WEB_PATH = '/var/www'

    ROOT_DATABASE_PASSWORD = 'toor'
    DATABASES = {
            'wind_db' : {
                    'db_name': 'windmaker_db',
                    'db_user': 'windmaker',
                    'db_pass': 'woshwosh',
                    'db_host': '%',
                    'origin': False,
                    'location': 'only_create',
                    'server_name': ['windcluster_wp.windmaker.net'],
                    'port': 80,
                }
    }

    '''
    Source can be:
        - only_create -> Salt will create only the database
        - remote -> Mysql host will download the database from another server
        - local -> The databse is stored in master node

        location:
          - remote -> (ssh) user@host:/pathto_sql_fiel
          - local -> name of the sql archive
    '''

    OPUS = {
        'windmaker_wp' :{
            'databases': [ DATABASES['wind_db'] ],
            'repo': 'https://github.com/a-castellano/windcluster_wp.git',
            'root': 'wp.windmaker.net',
            'opus_type': 'wordpress',
            'vhost_type': 'tamplate', #custom_template, custom
        }
    }


