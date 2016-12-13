include:
  - php.ng.cli
  - php.ng.gd
  - php.ng.apcu
  - php.ng.imagick
  - php.ng.imap
  - php.ng.mbstring
  - php.ng.mcrypt
  - php.ng.memcache
  - php.ng.mysqlnd
  - php.ng.pear
  - php.ng.redis
  - php.ng.soap
  - php.ng.xml
  
install_extra_packages:
  pkg.installed:
    - pkgs:
{% if pillar['php']['ng']['lookup']['extra_pkgs'] %}
{% for package in pillar['php']['ng']['lookup']['extra_pkgs'] %}
      - {{ package }}
{% endfor %}
{% endif %}

{% if pillar['php']['ng']['lookup']['opcode'] %}
      - {{ pillar['php']['ng']['lookup']['opcode'] }}
{% endif %}
      - php-xmlrpc
      - php-magickwand
      - php-snmp
      - php-tidy
      - php-pecl-geoip
      - php-pecl-lzf
      - php-pecl-ssh2
