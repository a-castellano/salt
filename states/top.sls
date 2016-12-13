base:

  'saltminion*':
    - openssh.openssh
    - system.system
    - mysql.mysql_client
    - php.init
    - php.install

  'saltminion2':
    - mysql.mysql
