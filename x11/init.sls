include:
  {% if grains['os']=="OpenBSD" %}
  - x11.packages-openbsd
  {% endif %}
