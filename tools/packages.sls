tools.packages:
  pkg.installed:
    - pkgs:
      - tree
      {% if grains['os']=="FreeBSD" %}
      - neovim
      - emacs
      - tmux
      {% elif grains['os']=="OpenBSD" %}
      - vim--no_x11
      - emacs--gtk3
      {% endif %}
