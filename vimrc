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

" Kalisi colour scheme
Plugin 'freeo/vim-kalisi'

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

" fugitive - a Git wrapper for vim. Also allows current
" git branch to be shown by vim-airline:
Plugin 'tpope/vim-fugitive'

" Plugin to help manage vim buffers:
Plugin 'jeetsukumaran/vim-buffergator'

" Plugin to highlight the variable under the cursor:
Plugin 'OrelSokolov/HiCursorWords'

" A plugin to switch between header and source files:
Plugin 'derekwyatt/vim-fswitch'

" Plugin to assist with commenting out blocks of text:
Plugin 'tomtom/tcomment_vim'

" Track the ultisnips engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them
Plugin 'honza/vim-snippets'

" Better C++ Syntax Highlighting:
Plugin 'octol/vim-cpp-enhanced-highlight'

" A plugin to use rtags in vim. (rtags allows for
" code following, some refactoring, etc.)
Plugin 'lyuts/vim-rtags'

" Plugin to generate doxygen documentation strings:
Plugin 'mrtazz/DoxygenToolkit.vim'

" tagbar - allows browsing tags of the current source file
" from ctags. Good for seeing functions, variables, etc.
Plugin 'majutsushi/tagbar'

" Plugin for syntax highlighting of plain text notes:
Plugin 'junegunn/vim-journal'

" Plugin to allow easy alignment around various symbols (e.g.
" line up a number of lines with equal signs on the equal signs)
Plugin 'junegunn/vim-easy-align'

" A plugin to make it easier to use motions to jump
" to words and characters:
Plugin 'easymotion/vim-easymotion'

" Plugin to provide a useful start screen in vim:
Plugin 'mhinz/vim-startify'

" Plugin to make it easy to delete a buffer and close the file:
Plugin 'mhinz/vim-sayonara'

" Base16 color schemes
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set rtp+=~/dotfiles

syntax enable
set background=dark
colorscheme base16-flat
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

" custom vim split commands
set splitbelow
set splitright


" cmake command
:command! Cmake !cmake ~/workspace/opal2/build-3dri-release

" Build ninja target in vim
:command! -nargs=1 Ninja execute "!cd ~/workspace/opal2/build-3dri-release && ninja " string(<q-args>) 

" Tmux style pane navigation
nnoremap <C-B>h <C-W>h
nnoremap <C-B>j <C-W>j
nnoremap <C-B>k <C-W>k
nnoremap <C-B>l <C-W>l

nnoremap <C-B>- <C-W>_
nnoremap <C-B>= <C-W>=

nnoremap <F2> :YcmCompleter GoTo<CR>
" tagbar config. Enable it using this key map:
nmap <F8> :TagbarToggle<CR>
" Have it autofocus on open:
let g:tagbar_autofocus = 1

" Tell vim to look for a tags file in the current
" directory, and all the way up until it finds one:
set tags=./tags;/

" Mapping to close the file in the current buffer:
nnoremap <leader>q :Sayonara!<CR>

