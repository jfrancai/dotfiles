# ~/.bashrc: executed by bash(1) for non-login shells.
# See bash(1) for more options
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# --- env var --- #

export USER="${USER:-$(whoami)}"
export HOME="${HOME:-"/home/$USER"}"
export REPOS="$HOME/repos"
export QDEUX="$REPOS/42"
export DOTFILES="$REPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export EDITOR=nvim
export VISUAL=nvim
export ZET="$REPOS/zet"
export LAB="$REPOS/lab"
export GO=/usr/local/go/bin
export GOPATH=$HOME/go
export ZIG="$HOME/zig/"
export EMCC="$HOME/emsdk/upstream/emscripten/"
export FOUNDRYUP="$HOME/.foundry/bin/"

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# --- history --- #

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

set -o vi
# append to the history file, don't overwrite it
shopt -s histappend

# --- pager --- #
# Use lesspipe for non-text file, more frendly looking. See lesspipe(1) 

if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

# --- shell --- #

export SHELL=bash

# --- path --- #

export PATH="$HOME/.local/bin":"$SCRIPTS":"$PATH":"$GO":"$GOPATH":"$GOPATH/bin":"$ZIG":"$HOME/.fly/bin":"$EMCC":"$FOUNDRYUP"

# --- cdpath --- #

export CDPATH=".:$GHREPOS:$QDEUX:$DOTFILES:$REPOS:$ZET:$LAB:$HOME"

# --- bash shell options --- #

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s expand_aliases
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar
shopt -s dotglob
#shopt -s extglob

# --- ctrl-S control flow desactivated --- #

stty stop undef

# --- ubuntu default bashrc --- #
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[0;\[\033[01;32m\]➜ \[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[33m\]$(parse_git_branch)\[\033[00m\] '
else
    PS1='\[\e[0;\[\033[01;32m\]➜  \w $(parse_git_branch) '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e[0;\[\033[33m\]${debian_chroot:+($debian_chroot)}\u@\h\[\033[33m\] $PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/jfrancai/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
