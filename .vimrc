set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'jaredgorski/spacecamp'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-flow.vim'
"Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
"Plug 'runoshun/tscompletejob'
Plug 'ervandew/supertab'
call plug#end()

colorscheme spacecamp

let g:ale_linters = {
  \   'javascript': ['eslint', 'prettier'],
  \   'typescript': ['eslint', 'tsserver', 'prettier'],
  \ }
let g:ale_fixers = {
  \   'javascript': ['eslint', 'prettier'],
  \   'typescript': ['eslint', 'prettier'],
  \ }
let g:ale_fix_on_save = 0
let g:ale_lint_delay = 500
let g:ale_pattern_options = {
  \   '.*node_modules.*$': {'ale_enabled': 0},
  \ }
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 0
let g:jsx_ext_required = 0
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--incremental'

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
  \ 'name': 'tscompletejob',
  \ 'allowlist': ['typescript'],
  \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
  \ 'config': {
  \   'prefer_local': 1,
  \   'show_typeinfo': 1
  \ }
  \ }))

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

syntax on
set regexpengine=2

autocmd VimResized * :wincmd =

" last edit position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set autoread

set noerrorbells

set history=10000

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start
set breakindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

autocmd FileType
  \ html,javascript,javascriptreact,jsx_pretty,typescript,typescriptreact,xml,yaml,markdown
  \ setlocal shiftwidth=2 tabstop=2 softtabstop=2

set number
set ruler
set laststatus=2

set hlsearch
set nofileignorecase
set nowildignorecase

set spelllang=en_us
syntax spell toplevel

nnoremap <CR> :noh<CR><CR>
