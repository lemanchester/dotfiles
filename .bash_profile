export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/opt/openssl/bin:/usr/local/opt/qt@5.5/bin:$PATH

export GOPATH=$HOME/go-workspace
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

alias git=hub
alias vim=nvim
alias vi=nvim
alias vscode=code
alias k=kubectl

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export CLICOLOR=1
export HOMEBREW_CACHE=/Library/Caches/Homebrew

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function clear_git_branches {
  git branch --merged | egrep -v "(^\*|develop|staging|master)" | xargs git branch -d
}

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function tabname {
     printf "\e]1;$1\a"
}

function path-copy {
     pwd | pbcopy
}

export PS1="\[\033[38m\]\u@\h\[\033[01;34m\] \w \[\033[31m\]\$(parse_git_branch)\[\033[37m\]$\[\033[00m\] "


export GREP_COLOR='1;32'

alias grep='grep --color=auto'
alias dm='docker-machine'
alias bex="bundle exec"
alias v="nvim"

# Colors
. /usr/local/etc/grc.bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
