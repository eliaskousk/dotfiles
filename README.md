dotfiles
========

My vim, zsh, tmux, git configuration files

Install
=======

# Get my dotfiles
git clone https://github.com/lupoGTI/dotfiles.git

# Instal Spf13 Vim distribution
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# Or if you don't have Curl installed
sh <(curl https://j.mp/spf13-vim3 -L)

# Install Oh my Zsh distribution
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Or if you don't have Curl installed
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# Link the dotfiles
ln -s dotfiles/vim/.* .
ln -s dotfiles/zsh/.zshrc
ln -s dotfiles/tmux/.tmux.conf .
ln -s dotfiles/git/.gitconfig .

Upgrade
=======

# Spf13 Automatic
curl https://j.mp/spf13-vim3 -L -o - | sh

# Or manual
# (the third line can be used to install or upgrade the vim bundles)
cd ~/.spf13-vim-3/
git pull
vim +BundleInstall! +BundleClean +q

# Oh-my-zsh
cd ~/.oh-my-zsh/
git pull

