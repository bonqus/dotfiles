# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/bonqus/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bira"
# ZSH_THEME="agnoster"
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git # a bunch of aliases: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  git-prompt
  gitfast
  # gitignore # gitignorre templates: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
  github # autocompletion for hub : https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github
  colored-man-pages # adds colors to manpages: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
  pip # autocompltetion for pip: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pip
  pipenv # autocompletion and auto activate pipenv: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pipenv
  pass # autocompletion for password manager: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pass
  vi-mode # vi like bindings: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
  jump # bookmarks: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jump
  emacs # Emacs daemon capability: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/emacs
  yarn # autocompletion for yarn: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
  # archlinux # a bunch of aliases
)

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
 
 

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh

# python virtenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /bin/virtualenvwrapper.sh

# User configuration

# Keybindings
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^f' vi-forward-blank-word
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^l' autosuggest-accept

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias update="yaourt -Syua"
alias convert_jupyter_to_python="ipython nbconvert --to=python"


# KEYTIMEOUT=1
# function zle-line-init zle-keymap-select {
#     # insert/normal mode tag
#     # VIM_PROMPT1="%{$fg[blue]%} [% NORMAL]%  %{$reset_color%}"
#     # VIM_PROMPT2="%{$fg[yellow]%} [% INSERT]%  %{$reset_color%}"
#     # RPS1="${${KEYMAP/vicmd/$VIM_PROMPT1}/(main|viins)/$VIM_PROMPT2} $EPS1"

#     # Super cool cursor change
#     if [ $KEYMAP = vicmd ]; then
#         # the command mode for vi
#         # echo -ne "\e[2 q"
#         print -n -- "\033[2 q"
#     else
#         # the insert mode for vi
#         print -n -- "\033[6 q"
#         # echo -ne "\e[4 q"
#     fi
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# opam configuration
test -r /home/bonqus/.opam/opam-init/init.zsh && . /home/bonqus/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
