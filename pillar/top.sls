base:
  '*':
    - environments.common.pkgs
    - environments.common.auth

  'saltminion*':
    - environments.windcluster.auth
