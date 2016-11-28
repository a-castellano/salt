base:
  '*':
    - states.common.ssh_auth
    - states.common.pkgs

  'saltminion*':
    - states.windcluster.root_ssh_key
#    - states.windcluster.mysql_client

  'saltminion2':
    - states.windcluster.mysql

