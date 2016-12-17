nginx:
  use_upstart: False
  ng:
    lookup:
      conf_file: /etc/nginx/nginx.conf
      vhost_available: /etc/nginx/sites-available
      vhost_enabled: /etc/nginx/sites-enabled
      vhost_use_symlink: True

    service:
      enable: True

    server:
      config:
        worker_processes: auto
        pid: /var/run/nginx.pid
        user: www-data
        events:
          worker_connections: 1024
        http:
          sendfile: 'on'
          access_log: /var/log/nginx/access.log
          server_names_hash_bucket_size: 128
          autoindex: 'off'
          server_tokens: 'off'
          open_file_cache: max=200000 inactive=20s
          open_file_cache_valid: 30s
          open_file_cache_min_uses: 2
          open_file_cache_errors: 'on'
          map $scheme $fastcgi_https:
            default: 'off'
            https: 'on'
          tcp_nopush: 'on'
          tcp_nodelay: 'on'
          keepalive_timeout: 60 15
          types_hash_max_size: 2048
          keepalive_requests: 100000
          reset_timedout_connection: 'on'
          client_header_timeout: 10m
          client_body_timeout: 10m
          send_timeout: 10m
          proxy_read_timeout: 2m
          fastcgi_read_timeout: 3m
          fastcgi_buffers: 16 16k
          fastcgi_buffer_size: 32k
          proxy_buffers: 16 16k
          proxy_buffer_size: 32k
          client_header_buffer_size: 1k
          large_client_header_buffers: 4 4k
          output_buffers: 1 32k
          postpone_output: 1460
          gzip: 'on'
          gzip_comp_level: 7
          gzip_http_version: 1.0
          gzip_buffers: 16 8k
          gzip_proxied: any
          gzip_types: text/plain text/css application/x-javascript application/javascript text/xml application/xml application/xml+rss text/javascript application/json image/svg+xml application/vnd.ms-fontobject application/x-font-ttf font/opentype font/x-woff
          gzip_vary: 'on'
          gzip_disable: '"MSIE [1-6]\.(?!.*SV1)"'
          upstream base_backend:
            server: 'unix:/var/run/php/php7.0-fpm.sock'
          include:
            - /etc/nginx/mime.types
            - /etc/nginx/conf.d/*.conf
            - /etc/nginx/sites-enabled/*

#    vhosts:
