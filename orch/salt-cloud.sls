deploy-new-server:
  salt.runner:
    - name: cloud.profile
    - prof: dev-icinga
    - instances:
      - icinga1.hakar.net

