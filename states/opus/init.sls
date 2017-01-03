{% for opus in pillar['opus'] %}
opus_{{ opus }}_repo:
    git.latest:
      - name: {{ pillar['opus'][opus]['repo'] }}
      - target: {{ pillar['opus'][opus]['path'] }}
{% endfor %}

