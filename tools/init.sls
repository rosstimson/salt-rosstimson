include:
  {% if grains['os']=="FreeBSD" %}
  - tools.packages-freebsd
  {% endif %}
  {% if grains['os']=="OpenBSD" %}
  - tools.packages-openbsd
  {% endif %}
