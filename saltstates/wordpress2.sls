get_wordpress:
  cmd.run:
    - name: 'wget -O latest.tar.gz http://wordpress.org/latest.tar.gz && tar xzf latest.tar.gz'
    - cwd: /tmp/
    - unless: cat /var/www/html/wp-config.php
