" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype off
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
call vundle#end()
filetype on

set noautowrite
set nobackup
set backspace=2
set comments=b:#,:%,fb:-,n:>,n:)
set dictionary=/usr/dict/words
set noerrorbells
"set noesckeys "causes strange pase behaviour on osx
set helpheight=0
set hidden
"set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set noicon
set noignorecase
set noinsertmode
set joinspaces
set laststatus=2
set magic
set nomodeline
set nonumber
set report=0
set ruler
set shell=bash
set shiftwidth=8
"set shortmess=at
set showcmd
set showmatch
set showmode
set tabstop=4
set title
set ttyfast
set ttybuiltin
set visualbell
set t_vb=
set whichwrap=<,>
" set wildchar=<TAB>
set nowritebackup
set undolevels=10000
"set cpoptions=aABceuFs

syntax on
set hlsearch
set incsearch

" Fix arrow key behaviour during insert mode
imap <ESC>OA <Up>
imap <ESC>OB <Down>
imap <ESC>OC <Right>
imap <ESC>OD <Left>

" window switching
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <F2> <C-w>k
nnoremap <F3> <C-w>j
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k

" jedi-vim settings
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#completions_command = "<C-space>"

nnoremap <F1> :w<CR>
inoremap <F1> <esc>:w<CR>

nnoremap <F7> :bd<CR>
inoremap <F7> <esc>:bd<CR>

nnoremap <F6> :bp\|bd #<CR>
inoremap <F6> <esc>:bp\|bd #<CR>

nnoremap <F8> :q<CR>
inoremap <F8> <esc>:q<CR>
