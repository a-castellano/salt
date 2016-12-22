base:

  'saltminion*':
    - mazes.windcluster.common
    - mazes.windcluster.mysql

  'saltminion1':
    - mazes.windcluster.frontend

  'saltminion2':
    - mazes.windcluster.frontend

  'saltminion4':
    - mazes.windcluster.mysql
