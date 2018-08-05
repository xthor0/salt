prod:
  'kernel:linux':
    - match: grain
    - linuxos
  'G@env:prod and G@roles:icinga2':
    - match: compound
    - icinga2

dev:
  'kernel:linux':
    - match: grain
    - linuxos
  'G@env:dev and G@roles:icinga2':
    - match: compound
    - icinga2
