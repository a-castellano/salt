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
    host: 192.168.10.12
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 192.168.10.0/24
      log_bin: /var/log/mysql/mysql-bin.log
      datadir: /var/lib/mysql
      port: 3306
      auto_increment_increment: 5
      binlog-ignore-db:
       - mysql
       - sys
       - information_schema
       - performance_schema

    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

