rosstimson:
  user.present:
    - fullname: Ross Timson
    - shell: /usr/local/bin/zsh
    - home: /home/rosstimson
    - uid: 1337
    - groups:
      - wheel

/home/rosstimson/code:
  file.directory:
    - user: rosstimson
    - group: rosstimson
    - mode: 755

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
