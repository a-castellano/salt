mysql-client:
  pkg.installed

/root/.my.cnf:
  file:
    - managed
    - source: salt://states/windcluster/files/my.cnf
    - template: jinja
    - user: root
    - group: root
    - mode: 755
