#!/usr/bin/env python
# -*- coding: utf-8 -*-

import yaml

class MazeGenertor():

    def __init__(self):
        maze = yaml.load(file('/srv/salt/pillar/mazes/windcluster/maze.sls', 'r'))

        self._maze = maze['maze']

    @property
    def maze(self):

        return self._maze
