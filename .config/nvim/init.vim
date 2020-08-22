" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'crusoexia/vim-monokai'
Plug 'HerringtonDarkholme/yats.vim' 
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

set nocompatible              " be iMproved, required
set encoding=utf-8
set termencoding=utf-8

" Initialize plugin system
call plug#end()


"   " Vundle begin
"   call vundle#begin()
"   Plugin 'gmarik/Vundle.vim'
"   Plugin 'scrooloose/nerdtree'
"   " Plugin 'derekwyatt/vim-scala'
"   " Plugin 'vim-ruby/vim-ruby'
"   " Plugin 'vim-syntastic/syntastic'
"   "  Plugin 'wincent/command-t'
"   " Plugin 'w0rp/ale'
"   " Plugin 'tpope/vim-fugitive'
"   Plugin 'pangloss/vim-javascript'
"   Plugin 'leafgarland/typescript-vim'
"   Plugin 'maxmellon/vim-jsx-pretty'
"   " Plugin 'mxw/vim-jsx'
"   Plugin 'neoclide/coc.nvim' , { 'branch' : 'release' }
"   " Plugin 'styled-components/vim-styled-components'
"   " Plugin 'udalov/kotlin-vim'
"   Plugin 'crusoexia/vim-monokai'
"   " Plugin 'haya14busa/incsearch.vim'
"   " Plugin 'ntpeters/vim-better-whitespace'
"   " Plugin 'skywind3000/asyncrun.vim'
"   " Plugin 'editorconfig/editorconfig-vim'
"   
"   call vundle#end()
"   " Vundle end

" Enables search with case insensitivity
set ignorecase
" Sets search to case sensitivity if a uppercase letter is in the query
" Smartcase depends on that ignorecase is set, and must be declared after it.
set smartcase

" Highlight 80-mark
highlight ColorColumn guibg=#aaaaaa
let &colorcolumn="80"

" Tell vim where to find the tags.
set tags=./tags,tags;$HOME

" Install FuzzyFinder
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf

" Setting fd as the default source for fzf
let FZF_DEFAULT_COMMAND='fd --type f'
" To apply the command to CTRL-T as well
let FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

set rtp+=~/.vim/bundle/Vundle.vim


filetype plugin indent on
syntax on
set number
" set paste

" Whitespace autofix on save
" let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

" Highlight current cursorline
set cursorline

" Set tab rules
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

" Colorscheme
colorscheme gruvbox

" Toggle comments in visual mode with '/'
vmap / <plug>NERDCommenterToggle

nnoremap nt :NERDTree<CR>

" Clear highlighting with \ space
nnoremap <Leader><space> :noh<cr>

" Move lines with C-j/k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Change tab with doubletab
map <Tab><Tab> gt
" NOTE: Should be <S-Tab><S-Tab> gT, but have remaped it in my OS to Escape
map <Esc><Esc> gT

" Move to window with ctrl-j and ctrl-k
map <C-H> <C-W>h
map <C-L> <C-W>w

" Quit with capital letters
:command Q q
:command W w

" Disable arrow keys
map <up> <Nop>
map <down> <Nop>
map <left> <Nop>
map <right> <Nop>

let NERDTreeIgnore = ['\.class$', '^node_modules$']
let g:NERDTreeNodeDelimiter = "\u00a0"

" Fix scroll-bug
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Auto completing
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>a :<C-u>CocList actions<cr>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList symbols<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>


" Open files with FZF
nnoremap <space><space> :FZF<CR>

" Crontab stuff
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

"  map /  <Plug>(incsearch-forward)
"  map ?  <Plug>(incsearch-backward)
"  map g/ <Plug>(incsearch-stay)

" Force vim to scan highlighting from start of file to not get out of sync.
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


hi CocErrorFloat guifg=#ff7777 guibg=#3f4145


