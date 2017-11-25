include:
  - salt.modules.mysql

mysql-client-5.5:
  pkg.installed

mysql-server-5.5:
  pkg.installed

python-mysqldb:
  pkg.installed

mysql-service:
  service.running:
    - name: mysql
    - require:
      - pkg: mysql-server-5.5

mysql-base:
  mysql_database.present:
    - name: pcur
    - require:
      - service.running: mysql
  mysql_user.present:
    - name: pcur
    - password: pcur
    - require:
      - service.running: mysql
  mysql_grants.present:
    - database: pcur.*
    - grant: ALL PRIVILEGES
    - user: pcur
    - require:
      - service.running: mysql
      - mysql_database.present: pcur
      - mysql_user.present: pcur
  require:
    - pkg: python-mysqldb
