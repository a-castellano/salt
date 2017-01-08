{% for opus in pillar['opus'] %}

opus_{{ opus }}_repo:
  git.latest:
    - name: {{ pillar['opus'][opus]['repo'] }}
    - target: {{ pillar['opus'][opus]['path'] }}

{{ pillar['opus'][opus]['path'] }}:
  file.directory:
    - user: {{ pillar['opus'][opus]['user'] }}
    - group: {{ pillar['opus'][opus]['group'] }}
    - mode: {{ pillar['opus'][opus]['mode'] }}
    - recurse:
      - user
      - group
      - mode

{% if  pillar['opus'][opus]['vhost_type'] == 'template' %}

{{pillar['opus'][opus]['vhost']}}:
  file:
    - managed
    - source: salt://templates/default/vhosts/{{pillar['opus'][opus]['server_type']}}/{{pillar['opus'][opus]['opus_type']}}/vhost.sls
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - defaults:
        target: {{opus}}

{% endif %}

{% if  pillar['opus'][opus]['opus_type'] == 'wordpress' %}
{{ pillar['opus'][opus]['path'] }}/wp-config.php:
  file:
    - managed
    - source: salt://templates/default/wordpress/wp-config.php
    - template: jinja
    - user: {{ pillar['opus'][opus]['user'] }}
    - group: {{ pillar['opus'][opus]['group'] }}
    - mode: {{ pillar['opus'][opus]['mode'] }}
    - defaults:
        target: {{opus}}


{% endif %}

{% endfor %}

