#!/bin/sh
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
shopt -s checkwinsize
shopt -s direxpand
shopt -s checkjobs
complete -cf doas


if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors \
    && eval "$(dircolors -b ~/.dircolors)" \
    || eval "$(dircolors -b)";
fi;

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion;
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

__PS1_PREFIX='\[\033[32m\]\u\[\033[0m\]'
[[ $UID -eq 0 ]] \
  && __PS1_PREFIX='\[\033[31m\]\u\[\033[0m\]';

__PS1_HOST='';
[[ -n "$SSH_CLIENT" || $UID -eq 0 ]] \
  && __PS1_HOST='\[\033[36m\]@\[\033[31m\]\h\[\033[0m\]';
__PS1_PROMPT='\[\033[32m\]>\[\033[0m\] ';

__prompt_git_info() {
  local ref;
  ref="$(GIT_OPTIONAL_LOCKS=0 git symbolic-ref --short HEAD 2>/dev/null)" \
  || ref="$(GIT_OPTIONAL_LOCKS=0 git rev-parse --short HEAD 2>/dev/null)" \
  || return 0;
  printf "\001\033[32m\002[%s]\001\033[0m\002" "${ref}";
}
__prompt_venv_info() {
  [[ -n "$VIRTUAL_ENV" ]] \
    && printf "\001\033[31m\002[%s]\001\033[0m\002" "${VIRTUAL_ENV}";
}

__PS1_PATH='\[\033[33m\]:\[\033[34m\]\w\[\033[0m\]';
__PS1_INFO='$(__prompt_git_info)$(__prompt_venv_info)'
PS1="${__PS1_PREFIX}${__PS1_HOST}${__PS1_PATH} ${__PS1_INFO}\n${__PS1_PROMPT}";
unset __PS1_PREFIX __PS1_HOST __PS1_PATH __PS1_PROMPT __PS1_INFO;

[ -f "$HOME/.config/bash/environ" ] && source "$HOME/.config/bash/environ";
[ -f "$HOME/.config/bash/functions" ] && source "$HOME/.config/bash/functions";
[ -f "$HOME/.config/bash/aliases" ] && source "$HOME/.config/bash/aliases";
