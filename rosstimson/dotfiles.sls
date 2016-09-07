dotfiles:
  git.latest:
    - name: https://github.com/rosstimson/dotfiles.git
    - target: /home/rosstimson/code/dotfiles
    - user: rosstimson
    - require:
      - pkg: base.packages
  cmd.wait:
    - name: make install
    - cwd: /home/rosstimson/code/dotfiles
    - shell: /usr/local/bin/bash
    - runas: rosstimson
    - watch:
      - git: dotfiles

