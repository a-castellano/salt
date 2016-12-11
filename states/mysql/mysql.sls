include:
  - mysql.server
  - mysql.client
  - mysql.python
  - mysql.database
  - mysql.user

create_slow_queries_logfile:
  file.managed:
    - name: /var/log/mysqld-slow-queries.log
    - user: mysql
    - group: mysql
    - mode: 644
