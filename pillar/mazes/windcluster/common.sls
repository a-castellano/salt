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
  pillar['openssh'] = remodel_openssh(demiurge.openssh, daedalus)
  pillar['mysql'] = remodel_mysql(demiurge.mysql, maze, daedalus)

  return pillar

####

def remodel_openssh(openssh, daedalus):

  for user in daedalus.SSH_AUTH:
    user_id = 'auth_ssh_' + user
    openssh['auth'][user_id] = []
    for key in daedalus.SSH_AUTH[user]:
      comment = user_id
      openssh['auth'][user_id] .append({
            'user': user,
            'name': key,
            'present': True,
            'env': 'ssh-rsa',
            'comment': comment,
         })


  return openssh


def remodel_mysql(mysql, maze, daedalus):

  mysql['server']['root_user'] = 'root'
  mysql['server']['root_password'] = daedalus.ROOT_DATABASE_PASSWORD
  mysql['server']['log_bin'] = '/var/log/mysql/mysql-bin.log'
  mysql['server']['host'] = 'localhost'


  db_host_ip = salt.saltutil.runner('mine.get',tgt='*',fun='network.ip_addrs',tgt_type='glob')[maze.maze['hosts']['db_host']]

  mysql['server']['mysqld']['bind-address'] = db_host_ip

  mysql['mysql_host'] = db_host_ip
  mysql['mysql_hostname'] = maze.maze['hosts']['db_host']

  return mysql


