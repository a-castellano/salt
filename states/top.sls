base:

  'saltminion*':
    - openssh.openssh
    - system.system
    - mysql.mysql_client

  'saltminion1':
    - php.init
    - php.install
    - nginx.init

  'saltminion2':
    - mysql.mysql
