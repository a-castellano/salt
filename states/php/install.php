include:
  - php.ng.fpm

php_session_permissions:
  file.directory:
    - name: /var/lib/php/session
    - user: {{ pillar['php']['ng']['fpm']['pools']['www.conf']['settings']['www']['listen.owner'] }}
    - group: {{ pillar['php']['ng']['fpm']['pools']['www.conf']['settings']['www']['listen.group'] }}
    
php_logs_dir_permissions:
  file.directory:
    - name: /var/log/php-fpm
    - user: {{ pillar['php']['ng']['fpm']['pools']['www.conf']['settings']['www']['listen.owner'] }}
    - group: {{ pillar['php']['ng']['fpm']['pools']['www.conf']['settings']['www']['listen.group'] }}
    - mode: 755
