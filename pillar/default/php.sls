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
            include: "/etc/php/7.0/fpm/pool.d/*.conf"
            global:
              pid: /var/run/php/php7.0-fpm.pid
              error_log: /var/log/php-fpm/error.log
              daemonize: "yes"
      pools:
        "www.conf":
          # If true, the pool file will be managed, if False it will be absent
          enabled: True
          settings:
            www:
              listen: /var/run/php/php7.0-fpm.sock
              listen.allowed_clients: 127.0.0.1
              listen.owner: www-data
              listen.group: www-data
              listen.mode: "0666"
              user: www-data
              group: www-data
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
              "php_admin_value[error_log]": /var/log/php-fpm/www-error.log
              "php_admin_flag[log_errors]": "on"
              "php_value[session.save_handler]": files
              "php_value[session.save_path]": /var/lib/php/session
              "php_value[memory_limit]": 256M

    ini:
      defaults:

        PHP:
          engine: "On"
          short_open_tag: "On"
          asp_tags: "Off"
          precision: 14
          upload_tmp_dir: "/tmp"
          output_buffering: 4096
          zlib.output_compression: "Off"
          implicit_flush: "Off"
          unserialize_callback_func: ""
          serialize_precision: 17
          ";open_basedir": "/var/www/url.com/:/tmp/:/usr/local/bin/"
          disable_functions: ""
          disable_classes: ""
          zend.enable_gc: "On"
          expose_php: "Off"
          max_execution_time: 30
          max_input_time: 60
          memory_limit: 512M
          error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
          display_errors: "Off"
          display_startup_errors: "Off"
          log_errors: "On"
          log_errors_max_len: 1024
          ignore_repeated_errors: "Off"
          ignore_repeated_source: "Off"
          report_memleaks: "On"
          track_errors: "Off"
          html_errors: "On"
          variables_order: "GPCS"
          request_order: "GP"
          register_argc_argv: "Off"
          auto_globals_jit: "On"
          post_max_size: 8M
          auto_append_file: ""
          default_mimetype: "text/html"
          doc_root: ""
          user_dir: ""
          enable_dl: "Off"
          file_uploads: "On"
          upload_max_filesize: 32M
          post_max_size: 32M
          max_file_uploads: 20
          allow_url_fopen: "On"
          allow_url_include: "Off"
          default_socket_timeout: 60
          
        CLI Server:
          cli_server_color: "On"
          
        Date:
          date.timezone: Europe/Madrid
          
        Pdo_mysql:
          pdo_mysql.cache_size: 2000
          pdo_mysql.default_socket: ""
          
        mail function:
          SMTP: localhost
          smtp_port: 25
          sendmail_path: /usr/sbin/sendmail -t -i
          
          mail.add_x_header: "On"
        SQL:
          sql.safe_mode: "Off"
          
        ODBC:
          odbc.allow_persistent: "On"
          odbc.check_persistent: "On"
          odbc.max_persistent: -1
          odbc.max_links: -1
          odbc.defaultlrl: 4096
          odbc.defaultbinmode: 1
          
        Interbase:
          ibase.allow_persistent: 1
          ibase.max_persistent: -1
          ibase.max_links: -1
          ibase.timestampformat: "%Y-%m-%d %H:%M:%S"
          ibase.dateformat: "%Y-%m-%d"
          ibase.timeformat: "%H:%M:%S"
          
        MySQL:
          mysql.allow_local_infile: "On"
          mysql.allow_persistent: "On"
          mysql.cache_size: 2000
          mysql.max_persistent: -1
          mysql.max_links: -1
          mysql.default_port: ""
          mysql.default_socket: ""
          mysql.default_host: ""
          mysql.default_user: ""
          mysql.default_password: ""
          mysql.connect_timeout: 60
          mysql.trace_mode: "Off"
          
        MySQLi:
          mysqli.max_persistent: -1
          mysqli.allow_persistent: "On"
          mysqli.max_links: -1
          mysqli.cache_size: 2000
          mysqli.default_port: 3306
          mysqli.default_socket: ""
          mysqli.default_host: ""
          mysqli.default_user: ""
          mysqli.default_pw: ""
          mysqli.reconnect: "Off"
          
        mysqlnd:
          mysqlnd.collect_statistics: "On"
          mysqlnd.collect_memory_statistics: "Off"
          
        PostgreSQL:
          pgsql.allow_persistent: "On"
          pgsql.auto_reset_persistent: "Off"
          pgsql.max_persistent: -1
          pgsql.max_links: -1
          pgsql.ignore_notice: 0
          pgsql.log_notice: 0
          
        Sybase-CT:
          sybct.allow_persistent: "On"
          sybct.max_persistent: -1
          sybct.max_links: -1
          sybct.min_server_severity: 10
          sybct.min_client_severity: 10
          
        bcmath:
          bcmath.scale: 0
          
        Session:
          session.save_handler: files
          session.use_cookies: 1
          session.use_only_cookies: 1
          session.name: PHPSESSID
          session.auto_start: 0
          session.cookie_lifetime: 0
          session.cookie_path: /
          session.cookie_domain: ""
          session.cookie_httponly: ""
          session.serialize_handler: php
          session.gc_probability: 1
          session.gc_divisor: 1000
          session.gc_maxlifetime: 86400
          session.referer_check: ""
          session.cache_limiter: nocache
          session.cache_expire: 180
          session.use_trans_sid: 0
          session.hash_function: 0
          session.hash_bits_per_character: 5
          url_rewriter.tags: '"a=href,area=href,frame=src,input=src,form=fakeentry"'
          
        MSSQL:
          mssql.allow_persistent: "On"
          mssql.max_persistent: -1
          mssql.max_links: -1
          mssql.min_error_severity: 10
          mssql.min_message_severity: 10
          mssql.compatability_mode: "Off"
          mssql.secure_connection: "Off"
          
        Tidy:
          tidy.clean_output: "Off"
          
        soap:
          soap.wsdl_cache_enabled: 1
          soap.wsdl_cache_dir: "/tmp"
          soap.wsdl_cache_ttl: 86400
          soap.wsdl_cache_limit: 5
          
        ldap:
          ldap.max_links: -1