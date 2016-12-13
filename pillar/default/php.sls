php:
  ng:
    lookup:
      pkgs:
        imagick: php-imagick
        #add more using a template
      extra_pkgs : False
    opcode : php7.0-opcache

    fpm:
      service:
        enabled: True
      config:
        conf:
          settings:
            include: '/etc/php/7.0/fpm/*.conf
            global:
              pid: /var/run/php/php7.0-fpm.pid
              error_log: /var/log/php-fpm/error.log
              daemonize: "yes"
      pools:
        'www.conf':
          enabled: True
          settings:
            www:
              listen: /var/run/php/php7.0-fpm.sock
              listen.allowed_clients: 127.0.0.1
              listen.owner: www-data
              listen.group: www-data
              listen.mode: "0666"
              user: nginx
              group: nginx
              pm: dynamic
              pm.max_children: 20
              pm.start_servers: 10
              pm.min_spare_servers: 5
              pm.max_spare_servers: 10
              pm.max_requests: 100
              pm.status_path: /php5fpm-status
              ping.path: /php5fpm-ping
              request_slowlog_timeout: 2s
              slowlog: /var/log/php-fpm/www-slow.log
              'php_admin_value[error_log]': /var/log/php-fpm/www-error.log
              'php_admin_flag[log_errors]': 'on'
              'php_value[session.save_handler]': files
              'php_value[session.save_path]': /var/lib/php/session
              'php_value[memory_limit]': 256M
