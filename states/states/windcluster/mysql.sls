mysql:
  group.present:
    - gid: 150
    - system: True

  user.present:
    - shell: /bin/false
    - home: /var/lib/mysql
    - uid: 150
    - gid: 150

include:
  - mysql.server
