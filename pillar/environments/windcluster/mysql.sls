mysql:


  global:
    client-server:
      default_character_set: utf8

  clients:
    mysql:
      default_character_set: utf8
    mysqldump:
      default_character_set: utf8

  library:
    client:
      default_character_set: utf8

  server:
    root_user: 'root'
    root_password: 'toor'
    user: mysql
    log_bin: /var/log/mysql/mysql-bin.log
    host: localhost
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 192.168.50.12
      datadir: /var/lib/mysql
      port: 3306

    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

  user:
    root:
      password: 'toor'
      host: '%'
      databases:
        - database: foo
          grants: ['all privileges']

mysql_host: 192.168.50.12

