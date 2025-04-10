#!/bin/bash

backup_file() {
  mv ${HOME}/$1 ${HOME}/$1.backup
}

# Install applications
## Apt apps from `dpkg --get-selections`
sudo dpkg --set-selections < ./dpkg.selections
sudo apt-get deselect-upgrade

## Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install Brew packages
### Created from `brew bundle dump --file=Brewfile`
brew bundle --file=./Brewfile

# https://www.gnu.org/software/stow/manual/stow.html#
if ! which stow >/dev/null 2>&1; then
  echo "Please install 'stow'"
  exit 1
fi

mkdir -p ${HOME}/bin && echo "Created ${HOME}/bin"

# Install Oh My Zsh
if ! which zsh >/dev/null 2>&1; then
  echo "Make sure to exit once ZSH is installed to continue"
  read -s -k '?Press any key to continue.'
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Link all the dotfiles to ~
stow --dotfiles -t ${HOME} .

# Install zsh theme Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Display more instructions
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NOCOLOR="\033[0m"
# Install vim package manager Vundle
echo -e "${BLUE}To configure Vim, run the following commands:"
echo "git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim"
echo "vim +PluginInstall +qa"
echo 
echo "To configure NeoVim <version>, run the following commands:"
echo "git clone git@github.com:treedy/kickstart.nvim.git ~/.config/nvim"
echo "cd ~/.config/nvim && git checkout personal"
echo
echo -e "${GREEN} Script complete!${NOCOLOR}"
