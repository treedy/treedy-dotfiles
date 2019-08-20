" Native Vim remappings and settings

" Required for YCM and other tools
set encoding=utf-8

" Syntax highlighting on
syntax on

" Remap the <leader> to a comma
let mapleader = ","

" Quick save with ",s"
nmap <leader>s :update<CR>

" Get out of insert mode by pressing "jk"
imap jk <ESC>

" Format tabs to 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" Use modeline
set modeline

" Show a margin line
set colorcolumn=80

" Allow mouse interaction
set mouse=a

" Show invisible characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" VUNDLE SETTINGS

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

" Completion plugin
" Plugin 'Valloric/YouCompleteMe'

" Snippet plugin
" Plugin 'SirVer/ultisnips'

" Pretty up the interface
" Vim status bar
Plugin 'vim-airline/vim-airline'
" More color schemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Have YCM use a different Python binary
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python3 completion
autocmd FileType python setlocal omnifunc=python3complete#Complete


" File tree toggle
map <F2> :NERDTreeToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Airline status bar config
" Show top file open line
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline_section_z = '%4l/%L:%03c'

" Set available colors
set t_Co=256

" Set the color scheme provided by a plugin
colorscheme twilight256


" UltiSnips settings
" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<CR>"  " Expand the selection, don't use TAB
"let g:UltiSnipsJumpForwardTrigger = "<tab>" " Go to next selection
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>" " Previous selection

