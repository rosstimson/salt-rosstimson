tools.packages:
  pkg.installed:
    - pkgs:
      - tree
      - xclip
      - aspell
      - password-store
      {% if grains['os']=="FreeBSD" %}
      - neovim
      - emacs
      - tmux
      {% elif grains['os']=="OpenBSD" %}
      - vim--no_x11
      - emacs--gtk2
      {% endif %}
