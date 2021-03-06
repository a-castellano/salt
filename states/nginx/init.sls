remove_default.conf:
  file.absent:
    - name: /etc/nginx/conf.d/default.conf

remove_example_ssl.conf:
  file.absent:
    - name: /etc/nginx/conf.d/example_ssl.conf

include:
  - nginx.ng

reload_nginx:
  service.running:
    - name: nginx
    - reload: True
    - force: True
