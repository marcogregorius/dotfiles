if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" to allow coc.nvim and ALE work together
let g:ale_disable_lsp = 1
" What do we use for linting
let g:ale_linters = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop']
\}

let g:ale_linters_explicit = 1

" Lint Ruby files with binstub
let g:ale_ruby_rubocop_executable = '/Users/gregoriusmarco/.asdf/shims/rubocop'

 "Let's leave a column for the signs so that the left side of the window doesn't move
let g:ale_sign_column_always = 1

" Specify a directory for plugins
" For Neovim: ~/.local/share/nvim/plugged
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'mileszs/ack.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
"Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
"Plug 'valloric/youcompleteme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'craigemery/vim-autotag'
"Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'voldikss/vim-translator'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-ruby/vim-ruby'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-rails'
Plug 'honza/vim-snippets'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'vim-autoformat/vim-autoformat'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()

" to have your code be formatted upon saving your file:
"au BufWrite * :Autoformat

nnoremap <C-p> :Files<Cr>
"nnoremap <C-[> :History<Cr>
nmap ; :Buffers<CR>

let g:coc_node_path = trim(system('which node'))

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on

"set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/bundle/ack.vim
colorscheme solarized
set bg=dark
set tags=tags


" kj - Get out of Insert mode
imap jk <Esc>
imap jj <Esc>
imap ;; <Esc>
imap kj <Esc>

"autocmd VimEnter * NERDTree
"noremap <Up> :resize +3<cr>
"noremap <Down> :resize -3<cr>
"noremap <Left> :vertical resize -3<cr>
"noremap <Right> :vertical resize +3<cr>

" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim<Paste>
"if executable('ag')
""   " Use ag over grep
"set grepprg=ag\ --nogroup\ --nocolor

""       " Use ag in CtrlP for listing files. Lightning fast and respects
""       .gitignore
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"" ag is fast enough that CtrlP doesn't need to cache
"let g:ctrlp_use_caching = 0
"let g:ackprg = 'ag --vimgrep'
"endif

set showcmd      " Shows what you are typing as a command
set nocompatible " Necessary for lots for cool vim things
set ruler        " Always show current positions along the bottom
set nu           " Set linenumber
set number relativenumber
set ai           " Auto indent
set si           " Smart indet
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

let mapleader = "\<Space>"
set ttimeoutlen=0

"map <Leader>p :call InsertPDB()<CR>

function! InsertPDB()
    let trace = expand("__import__('pdb').set_trace()")
    execute "normal o".trace
endfunction

" map Leader (space) + h for no highlight search
nmap <Leader>h :noh<CR>



" NERDTree shortcut
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFind<CR>
nmap <Leader>t :TagbarToggle<CR>

" easymotion fast find s
map s <Plug>(easymotion-s)

" Syntastic settings
nmap <Leader>c :SyntasticCheck<CR>
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_post_args="--max-line-length=200 --ignore=E303"

let python_highlight_all=1
syntax on

" instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" for firenvim paste
inoremap <D-v> <C-r>+


" Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" toggle between :paste and :nopaste
"set pastetoggle=<Leader>v

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
nnoremap T :tabnew 

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-S> :!git save<CR>
nnoremap <Leader>a :Ack! 
nnoremap <Leader>i :GoImplements<CR>
"toggle between :paste and :nopaste
nmap <leader>v :set paste!<CR>

" Gif config
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Translator options
"let g:translator_target_lang = 'en'
"let g:translator_source_lang = 'zh'
"nmap <silent> <Leader>t <Plug>Translate
"nmap <silent> <Leader>g <Plug>TranslateW

"set rtp+=~/.vim/plugged/YouCompleteMe
"
"---- start coc.nvim configurations ---
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ----------- end coc.nvim configuration ------------------
"
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_guifg = 'DarkGray'
"map <Leader>g :Goyo 90<CR>:set nu<CR>
"map <Leader>l :Limelight<CR>
"
"" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 0

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>


" enable mouse to drag pane size
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif


" firenvim
" Setup a shortcut variable to the per site settings array
let s:fc = {}
let g:firenvim_config = { 'localSettings': s:fc }
function! OnUIEnter(event) abort
  if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
  colorscheme gruvbox
  set bg=light
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

" Configure all sites
let s:fc['.*'] = { 'selector': 'textarea, div[role="textbox"]', 'priority': 0, 'takeover': 'never' }
"
