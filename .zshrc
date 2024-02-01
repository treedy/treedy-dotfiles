# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$HOME/bin:$HOME/google-cloud-sdk/bin:$HOME/go/bin:$HOME/.local/bin
OS_ID=$(/usr/bin/uname)
rust_path="stable-x86_64-unknown-linux-gnu"
if [ "$OS_ID" = "Darwin" ] ; then
  rust_path="stable-aarch64-apple-darwin"
fi

PATH=$PATH:$HOME/.rustup/toolchains/${rust_path}/bin
PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

function executable_exists() {
  which "$1" >/dev/null 2>&1
  return $?
}

# Homebrew env
BREWLOC="/opt/homebrew/bin/brew"
if [ -f "$BREWLOC" ]; then
  eval $($BREWLOC shellenv)
fi

# Python virtualenv support
if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=${HOME}/.virtualenv
  export PROJECT_HOME=$HOME/workspace
  export VIRTUALENVWRAPPER_PYTHON=$(which python3)
  export VIRTUALENVWRAPPER_WORKON_CD=1
  source $HOME/.local/bin/virtualenvwrapper.sh
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

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
plugins=(colored-man-pages tmux)
# Programming plugins
plugins+=(git npm golang)
# Container/DevOps plugins
plugins+=(docker kubectl)

ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if executable_exists nvim; then
  export EDITOR='nvim'
elif executable_exists vim; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

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
for alias_file in  ${HOME}/.alias.d/*.alias; do
  source "${alias_file}"
done

# Load command completions
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then
  source "${HOME}/google-cloud-sdk/completion.zsh.inc"
fi

if executable_exists aws; then  # Load the auto-completion script
  complete -C '/usr/local/bin/aws_completer' aws
fi

if executable_exists terraform; then  # Load the auto-completion script
  complete -o nospace -C '/usr/bin/terraform' terraform
fi

# Command line customizations
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Do not share history across prompts
unsetopt sharehistory
TZ='America/New_York'; export TZ

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load z for directory jumping
if [ -f  ${HOME}/bin/z/z.sh ]; then
  . ${HOME}/bin/z/z.sh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
