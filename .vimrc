execute pathogen#infect()
filetype plugin indent on
filetype plugin on

source $VIMRUNTIME/defaults.vim

if has("vms")
	set nobackup          " do not keep a backup file, use versions instead
else
	set backup            " keep a backup file (restore to previous version)
	if has('persistent_undo')
        	set undofile        " keep an undo file (undo changes after closing)
	endif
endif

if &t_Co > 2 || has("gui_running")
			      " Switch on highlighting the last used search
			      " pattern.
	set hlsearch
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ack.vim
colorscheme gruvbox
set bg=dark
set tags=tags

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

" kj - Get out of Insert mode
  imap jk <Esc>
  imap jj <Esc>
  imap ;; <Esc>

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
set si           " Smart indet
set wrap         " Wrap lines
syntax on
set relativenumber
set autoindent

" No sound on errors
 set noerrorbells
 set novisualbell
 set ignorecase   " Ignore case when searching
 set smartcase
 set hlsearch     " Highlight search things
 set incsearch    " Make search act like search in modern browsers
 set magic        " Set magic on, for regular expressions
 set showmatch    " Show matching bracets when text indic

let mapleader = "\<Space>"
 
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

" Syntastic settings
nmap <Leader>c :SyntasticCheck<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_post_args="--max-line-length=200"
