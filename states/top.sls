base:

  'saltminion*':
    - openssh.openssh
    - system
    - mysql.mysql_client

  'saltminion1':
    - php
    - php.install
    - nginx
    - opus

  'saltminion2':
    - php
    - php.install
    - nginx
    - opus

  'saltminion4':
    - mysql
