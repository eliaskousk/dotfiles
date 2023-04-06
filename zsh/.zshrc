# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lupo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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

# ZSH_TMUX_AUTOSTART=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell 
plugins=(rust command-not-found docker docker-compose emacs fasd git golang rust tmux ubuntu vi-mode vundle web-search zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
# Re-enabled ubuntu (ag was clashing with ag search tool)

# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export ALGS4=/opt/algs4
export CARGO=$HOME/.cargo
export CONDA=/opt/miniconda3
export CUDA=/usr/local/cuda
export DENO=$HOME/.deno
export FANCYDIFF=/opt/diff
export GHDL=/opt/ghdl
export GOROOT=/opt/go
export GOPATH=$HOME/Development/Software/GoWorkSpace
export HUB=/opt/hub
export LNAV=/opt/lnav
#export MODELSIM_INSTALL=/opt/modelsim/modeltech
export MAVEN=/opt/maven
export MODELSIM_INSTALL=/opt/modelsim/modelsim_ase
#export MODELSIM_INSTALL=/opt/questasim/questasim
export PTS=/opt/pts
export TIG=/opt/tig
export QEMURISCV=$HOME/Development/Software/Github/riscv/riscv-qemu/install
export RISCV=/opt/riscv
#export QEMU=/opt/qemu
export YSESS=/opt/ysess
export PATH=$ALGS4/bin:$CARGO/bin:$CONDA/bin:$CUDA/bin:$DENO/bin:$GHDL/bin:$FANCYDIFF:$GOROOT/bin:$GOPATH/bin:$HUB/bin:$LNAV/bin:$MAVEN/bin:$MODELSIM_INSTALL/bin:$PTS/bin:$TIG/bin:$QEMURISCV/bin:$RISCV/bin:$YSESS:$PATH

# CUDA
#export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64 ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# for tmux: export 256color
#[ -n "$TMUX" ] && export TERM=xterm-256color
#export TERM=xterm-256color

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

hd()
{
        hexdump -v -e '1/4 "%08X" "\n"' "$@"
        # OR
        # od -A n -t x -w4 -v "$@" | tr -d ' '
}

# Add Previous Command as Pet Snippet
function prev() {
    PREV=$(fc -lrn | head -n 1)
    sh -c "pet new `printf %q "$PREV"`"
}

# Select Pet Sniipets at Current Line (Like CTRL-R)
function pet-select() {
    BUFFER=$(pet search --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# Modelsim Variables
export MODELSIM=$MODELSIM_INSTALL/modelsim.ini
export LM_LICENSE_FILE=$MODELSIM_INSTALL/license.dat
#export MTI_VCO_MODE=64

# Aliases
alias ls='exa'
alias cat='bat'
#alias e='emacs'
#alias te='emacs -nw'
alias et='te'
alias en='eframe'
alias se='sudo emacs'
alias ste='sudo emacs -nw'
alias v='vim'
alias sv='sudo vim'
alias c='clear'
alias h='history'
alias hg='history | grep $1'
alias psg='ps aux | grep $1'
alias rm='rm -I'
#alias git='hub'
alias lg='lazygit'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias glop="glog"
alias gpp="~/Development/Software/Stromasys/Performance.Analysis/solaris-perf-utils/gen-perf-plots"
alias gv="gwenview"
alias pst='pueue status'
alias plg='pueue log'
alias kc='kubectl'

# Conda
# . /opt/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fzf (Fuzzy Finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH="/home/lupo/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/lupo/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/lupo/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/lupo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/lupo/perl5"; export PERL_MM_OPT;

# Android SDK
export ANDROID_HOME=/opt/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Node Version Manager (NVM)
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Hyperledger Fabric Tools
#export PATH=$PATH:/home/lupo/Development/Software/Github/hyperledger/fabric/build/bin


export PATH="$HOME/.poetry/bin:$PATH"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval $(thefuck --alias fu)

