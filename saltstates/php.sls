php7.0:
  pkg.installed:
    - pkgs:
      - php7.0-cli

install xdebug:
  pecl.installed:
    - name: xdebug
    - require:
      - pkg: php7.0
  cmd.run:
    - name: phpenmod xdebug
    - require:
      - pecl: install xdebug