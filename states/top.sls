include:
   - apache

base:
  '*':
    - states.common.ssh_auth
    - states.common.pkgs
