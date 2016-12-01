include:
  - mysql.server

{% for minion in pillar['minions_with_root_acces']  %}
grant_privileges_to_{{ minion }}:
   mysql_grants.present:
     - grant: all privileges
     - database: '*.*'
     - user: root
     - server: {{ minion }}
{% endfor %}
