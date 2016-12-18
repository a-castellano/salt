base:

  'saltminion*':
    - hostspaces.windcluster.common
    - hostspaces.windcluster.mysql

  'saltminion1':
    - hostspaces.windcluster.frontend

  'saltminion2':
    - hostspaces.windcluster.frontend

  'saltminion4':
    - hostspaces.windcluster.mysql
