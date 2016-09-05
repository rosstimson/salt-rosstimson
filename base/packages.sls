base.packages:
  pkg.installed:
    - pkgs:
      - bash
      - curl
      - git
      - wget
      - zsh
      {% if grains['os'] == 'OpenBSD' %}
      - colorls
      {% endif %}
