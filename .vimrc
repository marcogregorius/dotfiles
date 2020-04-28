if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" For Neovim: ~/.local/share/nvim/plugged
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
"Plug 'valloric/youcompleteme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'craigemery/vim-autotag'
Plug 'easymotion/vim-easymotion'
"Plug 'maralla/validator.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

filetype plugin indent on
"filetype plugin on

"source $VIMRUNTIME/defaults.vim

"if has("vms")
	"set nobackup          " do not keep a backup file, use versions instead
"else
	"set backup            " keep a backup file (restore to previous version)
	"if has('persistent_undo')
                "set undofile        " keep an undo file (undo changes after closing)
	"endif
"endif

"if &t_Co > 2 || has("gui_running")
			      "" Switch on highlighting the last used search
			      "" pattern.
	"set hlsearch
"endif

"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/ack.vim
colorscheme gruvbox
set bg=dark
set tags=tags


" kj - Get out of Insert mode
  imap jk <Esc>
  imap jj <Esc>
  imap ;; <Esc>
  imap kj <Esc>

" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim<Paste>
if executable('ag')
"   " Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

"       " Use ag in CtrlP for listing files. Lightning fast and respects
"       .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
	let g:ackprg = 'ag --vimgrep'
endif

set showcmd      " Shows what you are typing as a command
set nocompatible " Necessary for lots for cool vim things
set ruler        " Always show current positions along the bottom
set nu           " Set linenumber
set ai           " Auto indent
"set si           " Smart indet
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set wrap         " Wrap lines
"set relativenumber
set autoindent
set cursorline
"set cursorcolumn

" No sound on errors
 set noerrorbells
 set novisualbell
 set ignorecase   " Ignore case when searching
 set smartcase
 set hlsearch     " Highlight search things
 set incsearch    " Make search act like search in modern browsers
 set magic        " Set magic on, for regular expressions
 set showmatch    " Show matching bracets when text indic
 set foldmethod=indent
 set foldnestmax=10
 set nofoldenable
 set foldlevel=2
 set colorcolumn=120

let mapleader = "\<Space>"
set ttimeoutlen=0

map <Leader>p :call InsertPDB()<CR>

function! InsertPDB()
  let trace = expand("__import__('pdb').set_trace()")
  execute "normal o".trace
endfunction

" map Leader (space) + h for no highlight search
nmap <Leader>h :noh<CR>



" NERDTree shortcut
map <Leader>n :NERDTreeToggle<CR>
nmap <Leader>t :TagbarToggle<CR>

" easymotion fast find s
"map <Leader>s <Plug>(easymotion-s)

" Syntastic settings
nmap <Leader>c :SyntasticCheck<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_post_args="--max-line-length=120 --ignore=E303,W504"

" validator settings
"let g:validator_python_checkers = ['flake8']

let python_highlight_all=1
syntax on

" instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" toggle between :paste and :nopaste
"set pastetoggle=<Leader>v
nmap <leader>v :set paste!<CR>

let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 150

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap H gT
nnoremap L gt

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-S> :!git save<CR>

" Gif config
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

set rtp+=~/.vim/plugged/YouCompleteMe

" ale settings
let g:ale_python_flake8_options = '--ignore=E501,E201,E202,W504'
let g:ale_cache_executable_check_failures = 1

map <Leader>s :Gstatus<CR>

" 2 spaces indent for yaml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" for kitty to resize split panes with mouse
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
