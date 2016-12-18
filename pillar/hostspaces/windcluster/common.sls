#!py

import imp

def run():

  _hostspace = imp.load_source('hostspace', '/srv/salt/pillar/hostspaces/windcluster/HostspaceGenertor.py')
  _dedalus = imp.load_source('Dedalus', '/srv/salt/pillar/hostspaces/windcluster/Dedalus.py')
  _demiurge = imp.load_source('Demiurge', '/srv/salt/pillar/default/Demiurge.py')

  hostspace = _hostspace.HostspaceGenertor()
  dedalus = _dedalus.Dedalus()
  demiurge = _demiurge.Demiurge()

  pillar = {}

  pillar['system'] = demiurge.system
  pillar['openssh'] = remodel_openssh(demiurge.openssh)
  pillar['mysql'] = remodel_mysql(demiurge.mysql, hostsapce)

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

def remodel_mysql(mysql, hostspace):

  mysql['server']['root_user'] = 'root'
  mysql['server']['root_password'] = 'toor'
  mysql['server']['log_bin'] = '/var/log/mysql/mysql-bin.log'
  mysql['server']['host'] = 'localhost'


  db_host_ip = salt.saltutil.runner('mine.get',tgt='*',fun='network.ip_addrs',tgt_type='glob')[hostspace.hostspace['hosts']['db_host']]

  mysql['server']['mysqld']['bind-address'] = db_host_ip

  mysql['mysql_host'] = db_host_ip
  mysql['mysql_hostname'] = hostspace.hostspace['hosts']['db_host']

  return mysql
