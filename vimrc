set nocompatible              " be iMproved, required
filetype off                  " required

set ts=4 sw=4 expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Solarized colour scheme
"Plugin 'altercation/vim-colors-solarized.git'

" NERD Tree - file explorer for vim
Plugin 'scrooloose/nerdtree'

" vim-airline: 'Lean & mean status/tabline for vim that's light as air.'
Plugin 'bling/vim-airline'

" Plugin to assist with commenting out blocks of text:
Plugin 'tomtom/tcomment_vim'

" Better C++ Syntax Highlighting:
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

colorscheme slate
syntax enable
set background=dark
set nomousehide

set nu          "show line numbers
set ignorecase  "ignore case for searching
set autochdir   "current directory as path to current file

set wildmenu

" vim-airline: ensure the status line is always displayed
set laststatus=2

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" NERD Tree shortcut
map <F5> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
nnoremap <leader>n :NERDTree .<CR>

