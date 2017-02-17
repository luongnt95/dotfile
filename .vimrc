set enc=utf-8
set nocompatible
filetype off

" set Runtime path to inc Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" this is the call to begin the Vundle Plugin Opperation

call vundle#begin()

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kien/tabman.vim'

" status bar themes plugins and icons
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colorschemes plugins
Plugin 'ajh17/Spacegray.vim'
Plugin 'akmassey/vim-codeschool'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

syntax on

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd BufNewFile,BufRead *.axlsx set syntax=ruby " highlight syntax for extention
autocmd BufWritePre * %s/\s\+$//e " trim trailing spaces


" Global settings
set colorcolumn=81
set cursorline          " highlight current line
set expandtab
set hlsearch            " highlight matches
set incsearch           " search as characters are entered
set number
set relativenumber
set shiftwidth=2
set showmatch           " highlight matching [{()}]
set softtabstop=2
set tabstop=2

" GitGutter
set updatetime=250

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
set guifont=Anonymous\ Pro\ for\ Powerline
set laststatus=2

" ColorScheme
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors
colorscheme gruvbox
set background=dark

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Automatically delete the buffer of the file you just deleted with NerdTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Automatically delete the buffer of the file you just deleted with NerdTree

let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeAutoDeleteBuffer = 1 " Automatically delete the buffer of the file you just deleted with NerdTree

" NerdCommenter config
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

" Key mappings
let mapleader = " "
nmap <silent> <leader>v :NERDTreeFind<CR>
nmap <silent> <leader>f :NERDTreeTabsToggle<CR>
" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
noremap <leader>q :q<cr>
nnoremap <leader> :w<cr>

" This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
map <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" let g:indentLine_char = '+'

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Use a leader instead of the actual named binding
nmap <leader>o :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" CtrlSF plugin config
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

:nnoremap K i<CR><Esc>
:nmap <CR> o<ESC>

packadd! matchit