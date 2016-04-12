/boot/loader.conf:
  file.append:
    - text: |
        if_iwm_load="YES"
        iwm7260fw_load="YES"

/etc/rc.conf:
  file.append:
    - text: |
        wlans_iwm0="wlan0"
        ifconfig_wlan0="WPA SYNCDHCP"

/etc/wpa_supplicant.conf:
  file.managed:
    - source: salt://wifi/files/wpa_supplicant.conf
    - user: root
    - group: wheel
    - mode: 644

