# TODO install FZF with:
# go get gitub.com/junegunn/fzf/src/fzf
#
# Obviously needs Go env setup first.


## Removed from dotfiles Makefile

# Download and install FZF without using the installer which messes with
# dotfiles buy injecting lines into them.
	# git clone https://github.com/junegunn/fzf.git ${RT_HOME}/.fzf
	# @curl -sfL https://github.com/junegunn/fzf-bin/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tgz | tar xzvf - -C ${RT_HOME}/.fzf/bin
	# @chmod +x ${RT_HOME}/.fzf/bin/fzf-${FZF_VERSION}-linux_amd64
	# @ln -sf ${RT_HOME}/.fzf/bin/fzf-${FZF_VERSION}-linux_amd64 ${RT_HOME}/.fzf/bin/fzf

go get fzf:
  cmd.run:
    - runas: rosstimson
    - env:
      - GOPATH: '/home/rosstimson/code/go'
    - name: go get -u github.com/junegunn/fzf/src/fzf

git@github.com:junegunn/fzf.git:
  git.latest:
    - user: rosstimson
    - target: /home/rosstimson/.fzf
