/etc/hostname.iwm0:
  file.managed:
    - source: salt://wifi/files/hostname.iwm0
    - user: root
    - group: wheel
    - mode: 640

