base:

  'saltminion*':
    - openssh.openssh
    - system.system
    - mysql.mysql_client

  'saltminion2':
    - mysql.mysql
