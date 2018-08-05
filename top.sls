base:
  'kernel:linux':
    - match: grain
    - linuxos

prod:
  'G@env:prod and G@roles:icinga2':
    - match: compound
    - icinga2


dev:
  'G@env:dev and G@roles:icinga2':
    - match: compound
    - icinga2
