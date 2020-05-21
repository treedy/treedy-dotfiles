PATH=$HOME/bin:$HOME/google-cloud-sdk/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
export WORKON_HOME=${HOME}/.virtualenv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="candy"

# Powerlevel9k theme customizations
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_VI_INSERT_MODE_STRING=""
POWERLEVEL9K_VI_COMMAND_MODE_STRING="<<<"
POWERLEVEL9K_MODE='nerdfont-complete' # For fancy icons
# POWERLEVEL9K_MODE='awesome-fontconfig' # For fancy icons
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=steelblue
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=steelblue
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DELIMITER=»
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# System plugins
plugins=(colored-man-pages)
# Programming plugins
plugins+=(git npm golang)
# Container/DevOps plugins
plugins+=(docker kubectl)

PATH=$HOME/google-cloud-sdk/bin:$PATH

source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [ -r ${HOME}/.alias ]; then
  source ${HOME}/.alias
fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then
  source "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

# Command line customizations
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Do not share history across prompts
unsetopt sharehistory
