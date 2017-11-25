install docker:
  pkg.installed:
    - name: docker-engine

  cmd.script:
    - name: https://get.docker.com/
    - onfail_in:
      - pkg: docker-engine