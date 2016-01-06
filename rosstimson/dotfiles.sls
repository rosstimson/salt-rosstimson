dotfiles:
  git.latest:
    - name: https://github.com/rosstimson/dotfiles.git
    - target: /home/rosstimson/code/dotfiles
    - user: rosstimson
    - require:
      - pkg: base.packages
  cmd.wait:
    - name: gmake install
    - cwd: /home/rosstimson/code/dotfiles
    - shell: /usr/local/bin/bash
    - user: rosstimson
    - watch:
      - git: dotfiles

