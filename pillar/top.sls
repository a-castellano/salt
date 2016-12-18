base:

  'saltminion*':
    - hostspaces.windcluster.common
    - hostspaces.windcluster.mysql

  'saltminion1,saltminion2':
    - hostspaces.windcluster.frontend

  'saltminion4':
    - hostspaces.windcluster.mysql
