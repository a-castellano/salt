hostspace:
  network:
    dns: '8.8.8.8;8.8.4.4'

  hosts:
    frontends:
      saltminion1
    backends:
      saltminion2

    db_host:
      saltminion2
