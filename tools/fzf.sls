go get fzf:
  cmd.run:
    - runas: rosstimson
    - env:
      - GOPATH: '/home/rosstimson/code/go'
    - name: go get -u github.com/junegunn/fzf/src/fzf

https://github.com/junegunn/fzf.git:
  git.latest:
    - user: rosstimson
    - target: /home/rosstimson/.fzf
