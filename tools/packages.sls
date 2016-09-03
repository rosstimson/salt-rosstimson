# Packages to be installed only on FreeBSD
{% if grains['os']=="FreeBSD" %}
tools.packages:
  pkg.installed:
    - pkgs:
      - neovim
      - emacs
      - tree
      - tmux
{% endif %}

# Packages to be installed only on OpenBSD
{% if grains['os']=="OpenBSD" %}
tools.packages:
  pkg.installed:
    - pkgs:
      - vim--no_x11
      - emacs--gtk3
      - tree
{% endif %}
