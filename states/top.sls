base:

  'saltminion*':
    - openssh.openssh
    - system.system
    - mysql.mysql_client

  'saltminion1,saltminion2':
    - php
    - php.install
    - nginx

  'saltminion4':
    - mysql.mysql
