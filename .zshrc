# Path to your oh-my-zsh installation.
export ZSH=/home/bonqus/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize archlinux dirhistory pip repo chucknorris vi-mode)
# User configuration


source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='ec'
export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gdb="gdb -q"
alias update="yaourt -Syua"
alias con="emacs .i3/config"
alias fortuneanimal="command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n"
alias chuckinanimal="chuck -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n"

# colors() {
# 	local fgc bgc vals seq0

# 	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
# 	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
# 	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
# 	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

# 	# foreground colors
# 	for fgc in {30..37}; do
# 		# background colors
# 		for bgc in {40..47}; do
# 			fgc=${fgc#37} # white
# 			bgc=${bgc#40} # black

# 			vals="${fgc:+$fgc;}${bgc}"
# 			vals=${vals%%;}

# 			seq0="${vals:+\e[${vals}m}"
# 			printf "  %-9s" "${seq0:-(default)}"
# 			printf " ${seq0}TEXT\e[m"
# 			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
# 		done
# 		echo; echo
# 	done
# }

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey '^f' vi-forward-blank-word

zmodload zsh/terminfo
# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# # bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down


function zle-line-init zle-keymap-select {
    # insert/normal mode tag
    VIM_PROMPT1="%{$fg_bold[blue]%} [% NORMAL]%  %{$reset_color%}"
    VIM_PROMPT2="%{$fg_bold[yellow]%} [% INSERT]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT1}/(main|viins)/$VIM_PROMPT2} $EPS1"

    # Super cool cursor change
    if [ $KEYMAP = vicmd ]; then
        # the command mode for vi
        # echo -ne "\e[2 q"
        print -n -- "\033[2 q"
    else
        # the insert mode for vi
        print -n -- "\033[6 q"
        # echo -ne "\e[4 q"
    fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

