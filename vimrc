set nocompatible              " be iMproved, required
filetype off                  " required

set ts=2 sw=2 tw=80 expandtab

autocmd BufNewFile,BufRead *CMakeLists.txt set tw=160

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

" vim-tmux navigator
Plugin 'christoomey/vim-tmux-navigator' 

" vim-sleuth - heuristically determines spacing in terms
" of tabs, spaces, etc. based on what's in use in the
" current file and the file around it:
Plugin 'tpope/vim-sleuth'

" Tab-completion for '/' searching
Plugin 'vim-scripts/SearchComplete'

" matchit plugin
Plugin 'tmhedberg/matchit'

Plugin 'mhinz/vim-grepper'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set rtp+=~/dotfiles

syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-flat
set nomousehide 
set nu          "show line numbers
set ignorecase  "ignore case for searching
set autochdir   "current directory as path to current file

set wildmenu

" CtrlP options
" Set up Ctrl-P shortcut key for Ctrl-P:
" let g:ctrlp_working_path_mode = 0

" let g:ctrlp_map = '<c-k>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>m :CtrlPMRU<CR>
map <leader><Tab> :CtrlPBuffer<CR>

noremap <c-f> :CtrlP ~/nightly/src<CR>

" vim-airline: ensure the status line is always displayed
set laststatus=2

" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
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
nmap <F4> :FSHere<cr>

" Key mappings for clang-format, to format source code:
map <leader>f :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<CR>

" custom vim split commands
set splitbelow
set splitright


" Tmux style pane navigation
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-h> <C-w>h
nnoremap <c-l> <C-w>l

" nnoremap <C-B>- <C-W>_
" nnoremap <C-B>= <C-W>=

" YCM
nnoremap <F2> :YcmCompleter GoTo<CR>
nnoremap <F3> :YcmCompleter GetType<CR>

" tagbar config. Enable it using this key map:
nmap <F8> :TagbarToggle<CR>
" Have it autofocus on open:
let g:tagbar_autofocus = 1

" Tell vim to look for a tags file in the current
" directory, and all the way up until it finds one:
set tags=./tags;/

" Mapping to close the file in the current buffer:
nnoremap <leader>q :Sayonara!<CR>

" tmux navigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" terminal mode escape mapping
:tnoremap <Esc> <c-\><c-n> 

" This will execute the update command on leaving vim to a tmux pane. Default is Zero
let g:tmux_navigator_save_on_switch = 1

" Set up fswitch to work with the directory structures
" I'm currently using:
augroup fswitch_cpp
   au!
   au BufEnter *.h let b:fswitchdst  = 'cpp,hpp,cc,c'
   au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,../src,reg:|include/\w\+|src|,impl'
   au BufEnter *.cpp let b:fswitchdst  = 'hpp,h'
   au BufEnter *.cpp let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,../include,reg:|src/\(\w\+\)/src|src/\1/include/**|'
   au BufEnter *.hpp let b:fswitchdst  = 'h,cpp'
   au BufEnter *.hpp let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,../src,..'
augroup END
