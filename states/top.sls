include:
   - apache

base:
  '*':
    - states.common.ssh_auth
    - states.common.pkgs

  'saltminion*':
    - states.windcluster.root_ssh_key
