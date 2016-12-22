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

  pillar['system'] = demiurge.system
  pillar['openssh'] = remodel_openssh(demiurge.openssh)
  pillar['php'] = demiurge.php
  pillar['nginx'] = remodel_nginx(demiurge.nginx)

  return pillar

def remodel_openssh(openssh):

  openssh['auth']['windcluster'] = [
                                      {'user': 'root',
                                       'name': 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCoDeg52mYgYidGli6nqEDMlb6mZQlDV10EY6Y9twnFwAddcbs0YtFnVs045WVpxWWS42Sm9FPC/PYv9aNDuB+7RO6THAiAYpj4VsElm2Xkt21PiIrd2GBwMIvN25FDhAYTzpXCGabEKviKZx7vx5j/huzDvdom5DUfLtCjTH9XydJsakspM2UZDhrnc8+R1yZV+TCXjy9l/w1kkplkziwpLadzVUzhSQmPqAMkgVVnT7kw2FmDe8PJTZNB/gMmCSUS+ONULu2XrR4/ExnORf2CyHcr234TZAIUhjOta66UPjFIapoXrZFhnpjOZTnSd5BPTVINDt4fkutytDw4pe7x',
                                       'present': True,
                                       'env': 'ssh-rsa',
                                       'comment': 'windcluster_key',
                                      }
                                   ]

  return openssh

##############################################################################

def remodel_nginx(nginx):

  

  return nginx
