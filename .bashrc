#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#start
if [[ -z $DISPLAY ]]; then /home/alex/scripts/wm_choice.py; fi

alias ls='ls --color=auto'
alias tb='taskbook'
alias hotspot="create_ap Awlo1 enp0s20f0u6 'Arch' '12345678'&"
alias mkcd='mkcd.sh'

PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/alex/.local/bin:/home/alex/scripts"

set -o vi
source "$HOME/.cargo/env"
source "$HOME/.bash_aliases"
