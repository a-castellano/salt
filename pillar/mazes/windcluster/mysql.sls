#!py

import imp

import salt

def run():

  _maze = imp.load_source('maze', '/srv/salt/pillar/mazes/windcluster/MazeGenerator.py')
  _daedalus = imp.load_source('Daedalus', '/srv/salt/pillar/mazes/windcluster/Daedalus.py')
  _demiurge = imp.load_source('Demiurge', '/srv/salt/pillar/default/Demiurge.py')

  maze = _maze.MazeGenertor()
  daedalus = _daedalus.Daedalus()
  demiurge = _demiurge.Demiurge()

  pillar = {}

  pillar['mysql'] = remodel_mysql(demiurge.mysql, daedalus)

  return pillar

def remodel_mysql(mysql, daedalus):

  if daedalus.DATABASES:

    mysql['database'] = []

    for database in daedalus.DATABASES:

      mysql['database'].append(daedalus.DATABASES[database]['db_name'])

      mysql['user'][daedalus.DATABASES[database]['db_user']] = mysql['user'].get(daedalus.DATABASES[database]['db_user'],  {
                                                                                                                          'password': daedalus.DATABASES[database]['db_pass'],
                                                                                                                          'host': daedalus.DATABASES[database]['db_host'],
                                                                                                                          'databases': [],
                                                                                                                          })
      mysql['user'][daedalus.DATABASES[database]['db_user']]['databases'].append({'database': daedalus.DATABASES[database]['db_name'],'grants': ['all privileges']})

  return mysql
