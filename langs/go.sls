go:
  pkg.installed

gopath:
  file.directory:
    - user: rosstimson
    - group: rosstimson
    - makedirs: True
    - names:
      - /home/rosstimson/code/go/src
      - /home/rosstimson/code/go/pkg
      - /home/rosstimson/code/go/bin

# Go packages essential for coding Go.
# Vim and Emacs packages will expect these to be present.
go get packages:
  cmd.run:
    - runas: rosstimson
    - env:
      - GOPATH: '/home/rosstimson/code/go'
    - names:
      - go get -u golang.org/x/tools/cmd/goimports
      - go get -u golang.org/x/tools/cmd/guru
      - go get -u golang.org/x/tools/cmd/godoc
      - go get -u golang.org/x/tools/cmd/gorename
      - go get -u github.com/golang/lint/golint
      - go get -u github.com/kisielk/errcheck
      - go get -u github.com/rogpeppe/godef
      - go get -u github.com/jstemmer/gotags
      - go get -u github.com/nsf/gocode
