{%- set user = salt['pillar.get']('sift_user', 'sansforensics') -%}
include:
  - sift.packages.samba

sift-samba-global-config:
  file.managed:
    - name: /etc/samba/smb.conf
    - source: salt://sift/files/samba/smb.conf
    - template: jinja
    - context:
          user: {{ user }}
    - require:
      - sls: sift.packages.samba

samba-service-smbd:
  service.running:
    - name: smbd
    - watch:
      - file: sift-samba-global-config

samba-service-nmbd:
  service.running:
    - name: nmbd
    - watch:
      - file: sift-samba-global-config
