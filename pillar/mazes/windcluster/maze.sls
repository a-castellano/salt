maze:
  network:
    dns: '8.8.8.8;8.8.4.4'

  hosts:
    frontends:
      saltminion1
      saltminion2
    backends:
      saltminion4

    db_host:
      saltminion4
