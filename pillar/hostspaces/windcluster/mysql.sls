#!py

import imp

import salt

def run():

  _hostspace = imp.load_source('hostspace', '/srv/salt/pillar/hostspaces/windcluster/HostspaceGenertor.py')
  _dedalus = imp.load_source('Dedalus', '/srv/salt/pillar/hostspaces/windcluster/Dedalus.py')
  _demiurge = imp.load_source('Demiurge', '/srv/salt/pillar/default/Demiurge.py')

  hostspace = _hostspace.HostspaceGenertor()
  dedalus = _dedalus.Dedalus()
  demiurge = _demiurge.Demiurge()

  pillar = {}

  pillar['mysql'] = remodel_mysql(demiurge.mysql, hostspace)

  return pillar

def remodel_mysql(mysql, hostspace):

  mysql['server']['root_user'] = 'root'
  mysql['server']['root_password'] = 'toor'
  mysql['server']['log_bin'] = '/var/log/mysql/mysql-bin.log'
  mysql['server']['host'] = 'localhost'


  db_host_ip = salt.saltutil.runner('mine.get',tgt='*',fun='network.ip_addrs',tgt_type='glob')[hostspace.hostspace['hosts']['db_host']]

  mysql['server']['mysqld']['bind-address'] = db_host_ip

  mysql['mysql_host'] = db_host_ip

  mysql['user'] = { mysql['server']['root_user']: {
                    'password': mysql['server']['root_password'],
                    'host': '%',
                    'databases': [],
                  }
  }

  return mysql
