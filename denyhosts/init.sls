# this needs testing
# also needs some sort of way to know if this machine is accessible to the internet or not... otherwise,
# why install denyhosts?

# oh - and also - need to add my IP addresses in so that denyhosts doesn't block me :)
# /var/lib/denyhosts/allowed-hosts is where I do this

install-denyhosts-package:
  pkg.install:
    - name: denyhosts

denyhosts-config-file:
  file.managed:
    - name: /etc/denyhosts.conf
    - source: salt://denyhosts/files/denyhosts.conf
    - template: jinja
    - mode: 600
    - user: root
    - group: root

denyhosts-service:
  service.running:
    - enabled: True
    - require:
      - pkg: install-denyhosts-package
      - file: denyhosts-config-file
    - watch:
      - file: denyhosts-config-file
