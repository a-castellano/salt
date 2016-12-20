#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Dedalus():

    DATABASES = {
            'wind_db' : {
                    'db_name': 'windmaker_db',
                    'db_user': 'windmaker',
                    'db_pass': 'woshwosh',
                    'db_host': '%',
                    'origin': False,
                    'location': 'define it if origin is remote or local',
                },
             'wind_db_delete_me' : {
                    'db_name': 'windmaker_db2',
                    'db_user': 'windmaker',
                    'db_pass': 'woshwosh',
                    'db_host': '%',
                    'origin': False,
                    'location': 'define it if origin is remote or local',
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
