tools.packages:
  pkg.installed:
    - pkgs:
      - tree
      - xclip
      - aspell
      - password-store
      - the_silver_searcher
      {% if grains['os']=="FreeBSD" %}
      - neovim
      - emacs
      - tmux
      {% elif grains['os']=="OpenBSD" %}
      - vim--gtk2-perl-python-ruby
      - emacs--gtk2
      {% endif %}
