{%- for package in pillar['common']['essential_pkgs'].iteritems() -%}

  pkg.install: {{ package }}

{%- endfor -%}
