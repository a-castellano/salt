#!/usr/bin/env python
# -*- coding: utf-8 -*-

import yaml

class HostspaceGenertor():

    def __init__(self):
        hostspace = yaml.load(file('/srv/salt/pillar/hostspaces/windcluster/hostspace.sls', 'r'))

        self._hostspace = hostspace['hostspace']

    @property
    def hostspace(self):

        return self._hostspace
