#!/bin/bash

backup_file() {
  mv ${HOME}/$1 ${HOME}/$1.backup
  ln -s ${HOME}/treedy-dotfiles/$1 ${HOME}/$1
}

mkdir -p ${HOME}/bin && echo "Created ${HOME}/bin"

# Install Oh My Zsh
echo "Make sure to exit once ZSH is installed to continue"
read -s -k '?Press any key to continue.'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

backup_file .vimrc
backup_file .zshrc
backup_file .alias
backup_file .tmux.conf
backup_file .p10k.zsh

# Install zsh theme Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install vim package manager Vundle
echo "To configure Vim, run the following commands:"
echo "git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim"
echo "vim +PluginInstall +qa"

echo "To install NeoVim, run the following commands:"
echo "wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage -O ${HOME}/bin/nvim"
echo "chmod +x ${HOME}/bin/nvim"
echo "git clone git@github.com:treedy/kickstart.nvim.git ~/.config/nvim"
echo "cd ~/.config/nvim && git checkout personal"

echo ""
echo "Scrtipt complete!"
