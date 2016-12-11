install_essential_packages:
  pkg.installed:
  - pkgs: {{ pillar['system']['essential_pkgs'] }}
