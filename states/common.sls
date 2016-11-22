install_common_packages:
  pkg.installed:
    - pkgs:
      - htop
      - rsync
      - sudo
      - htop
      - {{ pillar['editor'] }}
      - screen
