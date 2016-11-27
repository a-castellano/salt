/root/.ssh:
  file.directory:
    - makedirs: True
    - user: root
    - group: root
    - mode: 600

/root/.ssh/id_rsa:
  file.managed:
    - source:
      - salt://states/states/windcluster/files/id_rsa
    - force: True
    - user: root
    - group: root
    - mode: 400
    - makedirs: True

/root/.ssh/id_rsa.pub:
  file.managed:
    - source:
      - salt://states/states/windcluster/files/id_rsa.pub
    - force: True
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
