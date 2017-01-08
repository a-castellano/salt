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
    SITES_ENABLED = '/etc/nginx/sites-enabled/'
    WEB_PORT = 80
    WEB_USER = 'www-data'
    WEB_USERS = ['windmaker']
    WEB_PATH = '/var/www/'

    ROOT_DATABASE_PASSWORD = 'toor'
    DATABASES = {
            'wind_db' : {
                    'db_name': 'windmaker_db',
                    'db_user': 'windmaker',
                    'db_pass': 'woshwosh',
                    'db_host': '%',
                    'origin': False,
                    'location': 'only_create',
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
            'root': WEB_PATH + 'wp.windmaker.net',
            'opus_type': 'wordpress',
            'vhost_type': 'template', #custom_template, custom
            'server_name': ['wp.windmaker.net'],
            'port': WEB_PORT,
            'server_type': WEB_SERVER,
            'user': WEB_USER,
            'group': WEB_USER,
            'mode': 755,
            'app':
            {
                'DB_CHARSET': 'utf8mb4',
                'DB_COLLATE': 'utf8_unicode_ci',
                'AUTH_KEY': 'iY@4V--$[%g^n;;dU2bt heQI#]+$V`SD0b^19ULLALCQ}]!xJvqr$86)i!|-W-i',
                'SECURE_AUTH_KEY': '3x {,8_1WVFqa8QZN|w^-0:r%ax0z.r.-.?)VGx`pK!f|*0kRV+lZOObzURFqdg{',
                'LOGGED_IN_KEY': '8>E+Yx~#]d)_c+l|uBspn,zM?GnBf+cbAsgWlbw*:3fwvPJ^z#0(,|Btg7lvBXWF',
                'NONCE_KEY': 'a[c|$a>DU%fqR(qSFEJVdd~ukc|{4E@}#uGscFYC:b#%E~p-q_{U6Y:.j|>r!%T+',
                'AUTH_SALT': 'ON~KG`x~^eR3$OO4(VIlE;cvqoOE<iI^9Z-uVwdDG1J%``f-F9I}pbY)ycw$d]JO',
                'SECURE_AUTH_SALT': 'B+>*0JRA?r;[0Z[r;]r7~p9ty.5y-OOf.5QPpLdnkHOG,~va:Fj`d@@wz(.1|+y{,
                'LOGGED_IN_SALT': 'Gfkz|@#fA.pFZ{1Po;z9mlX_G I&3~(=.4A^S%DCcYby-O:,urimq>wLd7t%4hiC',
                'NONCE_SALT': 'cf<m/0Lm[Y6G:fzm+bW!Tgd0(<Dqynnb$Fok%t/h}+/ZqGv&DoAsAQHm26IQMo$b',
                }
        }
    }


