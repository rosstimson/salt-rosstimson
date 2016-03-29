include:
  {% if grains['os']=="FreeBSD" %}
  - wifi.config.freebsd
  {% endif %}
  {% if grains['os']=="OpenBSD" %}
  - wifi.config.openbsd
  {% endif %}
