# =========================================================================
# My .zshrc file
#
# Written by Yansong Li.
#
# Some of this is my own creation, other functions are taken from various
# web sites or mailing lists, including:
# - http://leahneukirchen.org/dotfiles/.zshrc
#
# Last updated 2020-01-8
#
# Released into the public domain.
# ========================================================================

export TERM=xterm-256color
# Path to your oh-my-zsh installation.
export ZSH="/Users/liys/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# disabled the underline
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# =============================================
#            User configuration
# =============================================
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# redefine prompt_context for hiding user@hostname
prompt_context () { } 

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias t='tmux'
alias ta='tmux attach'

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/liys/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/liys/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/liys/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/liys/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# ========== go env ==========
export GOPATH="$HOME/goProjects/distributed"
export PATH="$PATH:$GOPATH/bin"

# ========== proxy ===========
export http_proxy="http://127.0.0.1:1087"
export https_proxy="http://127.0.0.1:1087"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
