#!/bin/bash

backup_file() {
  mv ${HOME}/$1 ${HOME}/$1.backup
  ln -s ${HOME}/treedy-dotfiles/$1 ${HOME}/$1
}
# Install Oh My Zsh
echo "Make sure to exit once ZSH is installed to continue"
read -s -k '?Press any key to continue.'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

backup_file .vimrc
backup_file .zshrc
backup_file .alias
backup_file .tmux.conf

# Install zsh theme Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install vim package manager Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
vim +PluginInstall +qa
