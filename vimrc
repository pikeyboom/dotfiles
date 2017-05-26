call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ihacklog/HiCursorWords'
Plug 'derekwyatt/vim-fswitch'
Plug 'tomtom/tcomment_vim' " Plugin to assist with commenting out blocks of text:
Plug 'SirVer/ultisnips' " Track the ultisnips engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them
Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ Syntax Highlighting:
Plug 'lyuts/vim-rtags' " A plugin to use rtags in vim. (rtags allows for code following, some refactoring, etc.)
Plug 'mrtazz/DoxygenToolkit.vim' " Plugin to generate doxygen documentation strings:
Plug 'majutsushi/tagbar' " tagbar - allows browsing tags of the current source file
Plug 'junegunn/vim-easy-align' " Plugin to allow easy alignment around various symbols
Plug 'easymotion/vim-easymotion' "Plugin to make it easier to use motions to jump to words and characters
Plug 'mhinz/vim-startify' "Plugin to provide a useful start screen in vim
Plug 'mhinz/vim-sayonara' "Plugin to make it easy to delete a buffer and close the file
Plug 'chriskempson/base16-vim' "Base16 color schemes
Plug 'christoomey/vim-tmux-navigator' "vim/tmux navigator
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/SearchComplete' " Tab-completion for '/' searching
Plug 'tmhedberg/matchit' " matchit plugin
Plug 'mhinz/vim-grepper'
Plug 'justinmk/vim-sneak' " Faster than using 'f'

call plug#end()            " required

set nocompatible              " be iMproved, required
filetype off                  " required

set ts=2 sw=2 tw=80 expandtab " quanergy convention

autocmd BufNewFile,BufRead *CMakeLists.txt set tw=160 "Don't wrap CMakeLists
autocmd BufNewFile,BufRead *.py set ts=4 sw=4 expandtab tw=0 "Python settings

filetype plugin indent on    " required

" add to runtime paths for Ultisnips
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

let g:ctrlp_cmd = 'CtrlP'
map <leader>m :CtrlPMRU<CR>
map <leader><Tab> :CtrlPBuffer<CR>

noremap <c-f> :CtrlP ~/current/src<CR>

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

" minimaist vim-sneak
let g:sneak#label = 1

" replace s with f for sneaking
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

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
