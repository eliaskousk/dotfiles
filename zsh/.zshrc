# Path to your oh-my-zsh installation.
export ZSH=/home/lupo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

#ZSH_TMUX_AUTOSTART=true

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found git tmux fasd emacs vi-mode vundle docker docker-compose cargo rust golang web-search zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
# Removed: ubuntu (ag clashes with ag search tool)

# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

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

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

export ALGS4=/opt/algs4
export CARGO=$HOME/.cargo
export CONDA=/opt/miniconda3
export CUDA=/usr/local/cuda
export FANCYDIFF=$HOME/Development/Software/Github/so-fancy
export GHDL=/opt/ghdl
export GOROOT=/opt/go
export GOPATH=$HOME/Development/Software/GoWorkSpace
export HUB=/opt/hub
export LNAV=/opt/lnav
#export MODELSIM_INSTALL=/opt/modelsim/modeltech
export MODELSIM_INSTALL=/opt/modelsim/modelsim_ase
#export MODELSIM_INSTALL=/opt/questasim/questasim
export TIG=/opt/tig
#export QEMU=/opt/qemu
export PATH=$ALGS4/bin:$CARGO/bin:$CONDA/bin:$CUDA/bin:$GHDL/bin:$FANCYDIFF/diff-so-fancy:$GOROOT/bin:$GOPATH/bin:$HUB/bin:$LNAV/bin:$MODELSIM_INSTALL/bin:$TIG/bin:$PATH

# CUDA
export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64 ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

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
alias git='hub'

# Conda
. /opt/miniconda3/etc/profile.d/conda.sh

# Fzf (Fuzzy Finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
