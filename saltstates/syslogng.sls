syslog-ng:
    pkg.installed:
        - pkgs:
            - syslog-ng
        - watch:
            - enable: True
            - reload: True