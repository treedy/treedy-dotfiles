" VUNDLE SETTINGS
" This file should be placed in the ~/.vim directory

" To install Vundle run
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Begin Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" Git support with :Git* commands
Plugin 'tpope/vim-fugitive'

" F2 for file tree
Plugin 'scrooloose/nerdtree'

" Quick comment with <leader>.<space>
Plugin 'scrooloose/nerdcommenter'

" Syntax checking. Runs files through external syntax checkers and displays any
" resulting errors to the user.
Plugin 'scrooloose/syntastic'

" Snippet plugin
" Plugin 'SirVer/ultisnips'

" Pretty up the interface
" Vim status bar
Plugin 'vim-airline/vim-airline'
" More color schemes
Plugin 'flazz/vim-colorschemes'

" Auto completer
" Plugin 'valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
