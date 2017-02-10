set nocompatible
set viminfo=
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tomasr/molokai'
Plugin 'vim-syntastic/syntastic'
Plugin 'mhinz/vim-signify'

call vundle#end()

filetype plugin indent on
syntax on

colorscheme molokai

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set cc=80
set number
set relativenumber
set encoding=utf-8
set scrolloff=15
set autoindent
set visualbell
set ruler
set cursorline
set laststatus=2
set wildmenu
set wildmode=list:longest,full
set foldmethod=indent
set foldnestmax=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe

" Way to edit with sudo
cnoreabbrev w!! w !sudo tee % > /dev/null

" Purple dye for excesses
hi OverLength ctermbg=red ctermfg=white
match OverLength /\%80v.\+/

" Special treatment
au! BufRead,BufNewFile Makefile.*       set filetype=make
au! BufRead,BufNewFile ~/.config/zsh/*  set filetype=zsh

" Removes end-of-line spaces
autocmd BufWritePre * :%s/\s\+$//e

" Fold life
map <A-a> zc
map <A-z> zr
map <A-e> zm

" Syntastic
let g:syntastic_quiet_messages = { "type": "style" }

" Tagbar
nmap <F8> :TagbarToggle<CR>

" CtrlP
let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

