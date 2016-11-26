install_essential_packages:
  pkg.installed:
  - pkgs: pillar['common']['essential_pkgs']
