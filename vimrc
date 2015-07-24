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
Plugin 'altercation/vim-colors-solarized.git'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" YCMGenerator - generates configs for YouCompleteMe
Plugin 'rdnetto/YCM-Generator'

" NERD Tree - file explorer for vim
Plugin 'scrooloose/nerdtree'

" Ctrl P
Plugin 'kien/ctrlp.vim'

" vim-airline: 'Lean & mean status/tabline for vim that's light as air.'
Plugin 'bling/vim-airline'

" A plugin to switch between header and source files:
Plugin 'derekwyatt/vim-fswitch'

" Plugin to assist with commenting out blocks of text:
Plugin 'tomtom/tcomment_vim'

" Track the ultisnips engine.
Plugin 'SirVer/ultisnips'

" Snippets are separted from the engine. Add this if you want them
Plugin 'honza/vim-snippets'

" Better C++ Syntax Highlighting:
Plugin 'octol/vim-cpp-enhanced-highlight'

" A plugin to use rtags in vim. (rtags allows for
" code following, some refactoring, etc.)
Plugin 'lyuts/vim-rtags'

" Plugin to highlight the variable under the cursor:
Plugin 'OrelSokolov/HiCursorWords'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set rtp+=~/dotfiles

syntax enable
set background=dark
colorscheme solarized
set nomousehide

set nu          "show line numbers
set ignorecase  "ignore case for searching
set autochdir   "current directory as path to current file

set wildmenu

" CtrlP options
" Set up Ctrl-P shortcut key for Ctrl-P:
let g:ctrlp_map = '<c-k>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>m :CtrlPMRU<CR>
map <leader><Tab> :CtrlPBuffer<CR>

" vim-airline: ensure the status line is always displayed
set laststatus=2

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Turn off prompting to load .ycm_extra_conf.py:
let g:ycm_confirm_extra_conf = 0

" Let YouCompleteMe use tag files for completion as well:
let g:ycm_collect_identifiers_from_tags_files = 1

" NERD Tree shortcut
map <F5> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
nnoremap <leader>n :NERDTree .<CR>

" Ultisnips config:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Mapping for fswitch, to switch between header
" and source:
nmap <silent> <Leader>of :FSHere<cr>

" Key mappings for clang-format, to format source code:
map <leader>f :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<CR>
