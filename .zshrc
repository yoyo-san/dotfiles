# Set up the prompt

autoload -Uz promptinit 
promptinit

setopt histignorealldups

bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=2000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

#Terminal stuff
#export TERM=xterm-256color

# Source files

# Precmd
precmd () {
	vcs_info
	print -Pn "\e]0;$USER@$HOST: %(1j,%j job%(2j|s|); ,)%~\a"
}


# Enable plugins
#plugins=(git)
#for plugin ($plugins); do
 # if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
  #  source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
  #elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
  #  source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  #fi
#done
#
# VCS info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true 
zstyle ':vcs_info:*' use-prompt-escapes true 
zstyle ':vcs_info:*' actionformats '%F{38}(%s) : [%f%F{172}%r%f/%F{118}%b%f%F{38}%F{38}]%f%c%m%u'
zstyle ':vcs_info:*' formats '%F{38}(%s):%f%F{172}%r%f %F{118}%b%f%F{38}%F{red}/%S%f'

# Completion
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _expand _ignored _approximate _expand_alias
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#zstyle ':completion:*' menu select

setopt completealiases #Alias & switches completion

setopt auto_cd
#cdpath=($HOME/projekti $HOME/Downloads $HOME/Desktop)

# DIR stack

#DIRSTACKFILE="$HOME/.zsh/dirs"
#if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#  [[ -d $dirstack[1] ]] && cd $dirstack[1]
#fi
#chpwd() {
#  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
#}

#DIRSTACKSIZE=20

#setopt pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

# Follow symbolic links (makes .. work)
setopt chase_links

# Not need to use cd, just use $ dir
setopt auto_cd

# Traditional cd
#setopt posix_cd

# Setup prompt
PROMPT='[%B%F{45}%n%f%F{82}@%f%F{33}%m%f]:%F{196}%~%f %F{46}$%b '
RPROMPT='${vcs_info_msg_0_}'


# Aliases
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias name="cat /etc/*-release | grep VERSION="
fi

# some more ls aliases
alias ll='ls -halF'
alias la='ls -hA'
alias l='ls -CF'

# Dirstack
alias p='pushd > /dev/null'
alias o='popd > /dev/null'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keymaps
#autoload -U history-search-end
typeset -A key

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end


# create a zkbd compatible hash;
# # to add other keys to this hash, see: man 5 terminfo
autoload zkbd
# [[ ! -f ${ZDOTDIR:-$HOME}/.zkbd/$TERM ]] && zkbd
    source ${ZDOTDIR:-$HOME}/.zkbd/$TERM

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-beginning-search 
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word


# VARS
export EDITOR=vi
export TERM=screen-256color

if [ -d "$HOME/.skripte" ] ; then
    PATH="$HOME/.skripte:$PATH"
fi
if [ -d "$HOME/.gem" ] ; then
    PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
fi

# Node version manager
if [ -f "/usr/share/nvm/init-nvm.sh" ] ; then
    source /usr/share/nvm/init-nvm.sh
fi

cd $HOME
