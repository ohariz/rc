set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'jaredgorski/spacecamp'
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ervandew/supertab'
call plug#end()

colorscheme spacecamp

let g:ale_linters = {
  \   'javascript': ['flow-language-server']
  \ }
let g:ale_fixers = {
  \   'javascript': ['eslint']
  \ }
let g:ale_fix_on_save = 1
let g:jsx_ext_required = 0
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
  \   'name': 'flow',
  \   'whitelist': ['javascript'],
  \   'completor': function('asyncomplete#sources#flow#completor'),
  \   'config': {
  \     'prefer_local': 1,
  \     'show_typeinfo': 1
  \   }
  \ }))

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

syntax on

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

set breakindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

autocmd FileType
  \ html,javascript,javascriptreact,jsx_pretty,typescript,typescriptreact,xml,yaml
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
