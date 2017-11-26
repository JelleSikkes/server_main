wordpress-packages:
  pkg.installed:
    - pkgs:
      - python-mysqldb
      - python-pip
      - php7.0
      - php7.0-mysql

get_wordpress:
  cmd.run:
    - name: 'wget -q -O - http://wordpress.org/latest.tar.gz | tar zxf - '
    - cwd: /var/www/html
    - creates: /var/www/html/wordpress/index.php
    - runas: root

/var/www/html/wordpress/wp-config.php:
  file.managed:
    - source: salt://vm/wp-config.php
    - user: www-data
    - group: www-data

/var/www/html/wordpress:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode

/etc/php/7.0/fpm/pool.d/www.conf:
  file.replace:
    - pattern: "listen = /var/run/php7.0-fpm.sock"
    - repl: "listen = 127.0.0.1:9000"
    - append_if_not_found: True