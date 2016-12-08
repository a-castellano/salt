base:

  'saltminion*':
    - states.openssh
    - states.system

  'saltminion2':
    - states.mysql
