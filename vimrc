set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdcommenter'
"Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'

call vundle#end()                              " Required for vundle
filetype plugin indent on                      " Required for vundle

syntax on                                      " Syntax highlighting
set nowrap                                     " Do not wrap long lines
set autoindent                                 " Indent at the same level of the previous line
set shiftwidth=4                               " Use indents of 4 spaces
set expandtab                                  " Tabs are spaces, not tabs
set tabstop=4                                  " An indentation every four columns
set softtabstop=4                              " Let backspace delete indent
set backspace=indent,eol,start                 " Backspace for dummies
set linespace=0                                " No extra spaces between rows
set number                                     " Line numbers on
set showmatch                                  " Show matching brackets/parenthesis
set incsearch                                  " Find as you type search
set hlsearch                                   " Highlight search terms
set winminheight=0                             " Windows can be 0 line high
set ignorecase                                 " Case insensitive search
set ruler
set smartcase                                  " Case sensitive when uc present
set wildmenu                                   " Show list instead of just completing
set wildmode=list:longest,full                 " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set undofile
set undodir=~/.vimundo/
set laststatus=2
"set colorcolumn=100
let mapleader=','
let maplocalleader=','

set pastetoggle=<F12>

" Nerd Tree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

autocmd FileType sql set sw=2
autocmd FileType sql set ts=2
autocmd FileType sql set sts=2

autocmd BufRead,BufNewFile *.txt set filetype=txt
autocmd FileType txt set sw=2
autocmd FileType txt set ts=2
autocmd FileType txt set sts=2

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

autocmd FileType yaml set sw=2
autocmd FileType yaml set ts=2
autocmd FileType yaml set sts=2

autocmd FileType c set sw=2
autocmd FileType c set ts=2
autocmd FileType c set sts=2

autocmd FileType cpp set sw=2
autocmd FileType cpp set ts=2
autocmd FileType cpp set sts=2

autocmd FileType json set syntax=off

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" ALE
"let g:ale_sign_warning = '▲'
"let g:ale_sign_error = '✗'
"highlight link ALEWarningSign String
"highlight link ALEErrorSign Title
map <leader>at :ALEToggle<CR>

" Lightline
let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

runtime macros/matchit.vim

set completeopt-=preview
