{%- for key in pillar['common']['authorized_keys'].iteritems() -%}

  ssh.set_auth_key root "ssh-rsa {{key}}"

{%- endfor -%}
