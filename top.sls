prod:
  'G@env:prod and G@kernel:linux':
    - match: compound
    - linuxos
  'G@env:prod and G@roles:icinga2':
    - match: compound
    - icinga2

dev:
  'G@env:dev and G@kernel:linux':
    - match: compound
    - linuxos
  'G@env:dev and G@roles:icinga2':
    - match: compound
    - icinga2
