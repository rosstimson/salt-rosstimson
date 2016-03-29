include:
  - base.packages
  {% if grains['os']=="FreeBSD" %}
  - base.sudo
  {% endif %}
