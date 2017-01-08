#!py

import imp

def run():

  _maze = imp.load_source('maze', '/srv/salt/pillar/mazes/windcluster/MazeGenerator.py')
  _daedalus = imp.load_source('Daedalus', '/srv/salt/pillar/mazes/windcluster/Daedalus.py')
  _demiurge = imp.load_source('Demiurge', '/srv/salt/pillar/default/Demiurge.py')

  maze = _maze.MazeGenertor()
  daedalus = _daedalus.Daedalus()
  demiurge = _demiurge.Demiurge()

  pillar = {}

  pillar['php'] = demiurge.php
  pillar['opus'] = make_opus(demiurge.opus, daedalus)

  if daedalus.WEB_SERVER == 'nginx':
    pillar['nginx'] = remodel_nginx(demiurge.nginx)

  return pillar

##############################################################################

def remodel_nginx(nginx):

  

  return nginx

def make_opus(opus, daedalus):

  for item in daedalus.OPUS:
    opus[item] = daedalus.OPUS[item]
    opus[item]['path'] = daedalus.WEB_PATH + item
    opus[item]['vhost'] = daedalus.SITES_ENABLED + item + '.cfg'

  return opus
