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

  pillar['mysql'] = remodel_mysql(demiurge.mysql, dedalus)

  return pillar

def remodel_mysql(mysql, dedalus):

  if dedalus.DATABASES:

    mysql['database'] = []

    for database in dedalus.DATABASES:

      mysql['database'].append(dedalus.DATABASES[database]['db_name'])

      mysql['user'][dedalus.DATABASES[database]['db_user']] = mysql['user'].get(dedalus.DATABASES[database]['db_user'],  {
                                                                                                                          'password': dedalus.DATABASES[database]['db_pass'],
                                                                                                                          'host': dedalus.DATABASES[database]['db_host'],
                                                                                                                          'databases': [],
                                                                                                                          })
      mysql['user'][dedalus.DATABASES[database]['db_user']]['databases'].append({'database': dedalus.DATABASES[database]['db_name'],'grants': ['all privileges']})

  return mysql
