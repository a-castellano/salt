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

 mysql['user'] = { mysql['server']['root_user']: {
                    'password': mysql['server']['root_password'],
                    'host': '%',
                    'databases': [],
                  }
  }

  return mysql
