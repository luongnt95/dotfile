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
Plugin 'dyng/ctrlsf.vim'

Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'easymotion/vim-easymotion'

" Plugin 'ervandew/supertab'
Plugin 'Konfekt/FastFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/tabman.vim'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/LargeFile'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" Plugin 'lygaret/autohighlight.vim'
Plugin 'takac/vim-hardtime'
" let g:hardtime_default_on = 1

Plugin 'justinmk/vim-sneak'
" let g:sneak#streak = 1

" Plugin 'tpope/vim-vinegar'

" Reactjs
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" HTML/CSS
Plugin 'mattn/emmet-vim'

" Python
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-python/python-syntax'
let g:python_highlight_all = 1

" Ruby/Rails
Plugin 'tpope/vim-rails'

" Solidity
Plugin 'tomlion/vim-solidity'

" C/C++
Plugin 'c.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" status bar themes plugins and icons
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colorschemes plugins
Plugin 'tyrannicaltoucan/vim-quantum'
" Plugin 'ayu-theme/ayu-vim'
Plugin 'drewtempelmeyer/palenight.vim'
" Plugin 'ajh17/Spacegray.vim'
Plugin 'akmassey/vim-codeschool'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
" Plugin 'herrbischoff/cobalt2.vim'
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'joshdick/onedark.vim'

Plugin 'ryanoasis/vim-devicons'

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
set ignorecase smartcase
set number
set relativenumber
set shiftwidth=2
set showmatch           " highlight matching [{()}]
set softtabstop=2
set tabstop=2
set smarttab
set autoindent
set ttyfast
set lazyredraw

" GitGutter
set updatetime=250

nmap <Leader>gp <Plug>GitGutterPreviewHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gs <Plug>GitGutterStageHunk

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
let g:airline_theme="dark"
" set guifont=Anonymous\ Pro\ for\ Powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set laststatus=2

" ColorScheme
set t_Co=256
" set t_AB=[48;5;%dm
" set t_AF=[38;5;%dm

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors
" colorscheme gruvbox
colorscheme palenight
set background=dark

"Make comments italic
" set t_ZH=[3m
" set t_ZR=[23m
" highlight Comment cterm=italic

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Automatically delete the buffer of the file you just deleted with NerdTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Automatically delete the buffer of the file you just deleted with NerdTree

let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1 " Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeIgnore=['\.pyc$', '\.evm$', '\.disasm$', '\.disasm.log$', 'node_modules$[[dir]]' ,'\~$']

" NerdCommenter config
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

" Key mappings
let mapleader = " "
nmap <silent> <leader>v :NERDTreeFind<CR>
nmap <silent> <leader>f :NERDTreeTabsToggle<CR>
" map <silent> <leader>t :NERDTreeToggle<CR> :NERDTreeMirror<CR>
" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
noremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

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
map <leader>x :bp <BAR> bd #<CR>

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

  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
endif

" Use a leader instead of the actual named binding
" nmap <leader>o :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMixed<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
" nmap <leader>bm :CtrlPMixed<cr>
" nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>o :CtrlPMRU<cr>

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

" Vim-expand-region config
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Vim exchange
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

let g:LargeFile = 1

" Folding
" You can close all folds with zM. If you have nested folds and you want to fold
" level by level, use zm. To open folds use zR (all) and zr (level by level).

if has('folding')
  if has('windows')
    let &fillchars='vert: '           " less cluttered vertical window separators
  endif
  set foldmethod=syntax               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded

  let javaScript_fold=1         " JavaScript
  let ruby_fold=1               " Ruby
endif

" nnoremap <F5> :set invpaste paste?<Enter>
" imap <F5> <C-O><F5>
" set pastetoggle=<F5>

" Auto save vim session on quit and auto reload on start
let g:session_directory="~/.vim/session"
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_command_aliases = 1

" vim-session config
nnoremap <leader>so :OpenSession<space>
nnoremap <leader>ss :SaveSession<space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Tabular config
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command

" You can use Ctrl+Space to trigger the completion suggestions anywhere, even without a string prefix. This is useful to see which top-level functions are available for use.

" make YouCompleteMe compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabDefaultCompletionType = '<tab>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger = "<s-c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" <C-X><C-L> complete whole lines
" <C-X><C-P> complete words (<C-P> has the same effect; <C-X> is not needed)
" <C-X><C-F> complete file names
" <C-X>s spelling suggestions (after :setl spell to enable spell checking)

" Tagbar
nmap <F8> :TagbarToggle<CR>
" autocmd FileType * nested :call tagbar#autoopen(0)

" IndentLine config
let g:indentLine_fileTypeExclude=['help']
let g:indentLine_bufNameExclude=['NERD_tree.*']

" Ctrl-p
let g:ctrlp_by_filename = 1

" Reactjs
let g:jsx_ext_required = 0

" Easymotion
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" set exrc
" set secure

