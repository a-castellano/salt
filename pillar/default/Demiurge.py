#!/usr/bin/env python
# -*- coding: utf-8 -*-

import yaml
import json

class Demiurge():

    def __init__(self):

        self._system = self._set_system()
        self._openssh = self._set_openssh()
        self._mysql = self._set_mysql()
        self._php = self._set_php()

    #properties

    @property
    def system(self):
        return self._system

    @property
    def openssh(self):
        return self._openssh

    @property
    def mysql(self):
        return self._mysql

    @property
    def php(self):
        return self._php

    #setters

    def _set_system(self):

        config = yaml.load(file('/srv/salt/pillar/default/system.sls', 'r'))

        return config['system']

    def _set_openssh(self):

        config = yaml.load(file('/srv/salt/pillar/default/openssh.sls', 'r'))

        return config['openssh']

    def _set_mysql(self):

        config = yaml.load(file('/srv/salt/pillar/default/mysql.sls', 'r'))

        return config['mysql']

    def _set_php(self):

        config = yaml.load(file('/srv/salt/pillar/default/php.sls', 'r'))

        return config['php']
