{#

I'm not sure there is a lot of value in managing this in. The Salt bootstrap script handles installing it
and most VMs are stood up with salt-cloud. I'm killing this for now.

By killing it - I mean, removing it from init.sls in linuxos...

#}

# centos systems
{% if grains.get('os', '') == 'CentOS' %}
salt-latest:
  pkgrepo.managed:
    - humanname: SaltStack Latest Release Channel for RHEL/Centos $releasever
    - baseurl: https://repo.saltstack.com/yum/redhat/7/$basearch/latest
    - gpgcheck: 1
    - gpgkey: file:///etc/pki/rpm-gpg/saltstack-signing-key
    - failovermethod: priority

/etc/pki/rpm-gpg/saltstack-signing-key:
  file.managed:
    - source: salt://linuxos/files/etc/pki/rpm-gpg/saltstack-signing-key
    - user: root
    - group: root
    - mode: 644
{% endif %}

# ubuntu systems
{% if grains.get('os', '') == 'Ubuntu' %}
salt-latest:
  pkgrepo.absent:
    - ppa: saltstack/salt
{% endif %}

salt-minion:
  pkg.installed


/etc/salt/minion:
  file.managed:
    - source: salt://linuxos/files/etc/salt/minion
    - user: root
    - group: root
    - mode: 600
    - template: jinja

salt-minion-service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/minion
