set nocompatible              " be iMproved, required
set encoding=utf-8
set termencoding=utf-8

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
" Vundle begin
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'vim-ruby/vim-ruby'
" Plugin 'vim-syntastic/syntastic'
Plugin 'wincent/command-t'
" Plugin 'w0rp/ale'
" Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'maxmellon/vim-jsx-pretty'
" Plugin 'mxw/vim-jsx'
Plugin 'neoclide/coc.nvim' , { 'branch' : 'release' }
" Plugin 'styled-components/vim-styled-components'
" Plugin 'udalov/kotlin-vim'
Plugin 'crusoexia/vim-monokai'
" Plugin 'haya14busa/incsearch.vim'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'skywind3000/asyncrun.vim'
" Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
" Vundle end

filetype plugin indent on
syntax on
set number
set paste

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

" Javascript
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" ALE
" let g:ale_fixers = {'jsx': ['stylelint', 'eslint'], 'javascript': ['eslint', 'prettier']}
" let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'javascript': ['eslint']}
"
" let g:ale_fixers['typescript'] = ['prettier']
" let g:ale_fixers['typescript.tsx'] = ['prettier']
"
" let g:ale_fix_on_save = 1
" let g:ale_linter_aliases = {'jsx': 'css'}
" let g:ale_sign_error = '>>' " Less aggressive than the default '>>'
" let g:ale_sign_warning = '.'
" " let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" let g:ale_lint_on_text_changed ='never'

" Prettier thingy
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

nnoremap nt :NERDTree<CR>

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

let NERDTreeIgnore = ['\.class$']
let g:NERDTreeNodeDelimiter = "\u00a0"

" Fix scroll-bug
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Auto completing
let g:coc_global_extensions = [ 'coc-tsserver' ]
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif


" Open files with FZF
nnoremap <space><space> :FZF<CR>

" Crontab stuff
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Force vim to scan highlighting from start of file to not get out of sync.
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

