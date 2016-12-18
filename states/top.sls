base:

  'saltminion*':
    - openssh.openssh
    - system
    - mysql.mysql_client

  'saltminion1':
    - php
    - php.install
    - nginx

  'saltminion2':
    - php
    - php.install
    - nginx

  'saltminion4':
    - mysql
