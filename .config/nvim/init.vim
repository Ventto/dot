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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on
syntax on

" #===========================#
"
"            Basic
"
" #===========================#

colorscheme molokai
cnoreabbrev w!! w !sudo tee % > /dev/null

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
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
set mouse=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
set cc=79

" Colors colum limit
hi OverLength ctermbg=red ctermfg=black
match OverLength /\%80v.\+/

" Deletes eol spaces
autocmd BufWritePre * :%s/\s\+$//e

" Filetype syntax highlighting
au! BufRead,BufNewFile *.gdb            set filetype=gdb
au! BufRead,BufNewFile Makefile.*       set filetype=make
au! BufRead,BufNewFile ~/.config/zsh/*  set filetype=zsh

" Fold life
map <A-a> zc
map <A-z> zr
map <A-e> zm

" #===========================#
"
"           Plugins
"
" #===========================#

" Syntastic
let g:syntastic_c_checkers = ['checkpatch', 'gcc']
let g:syntastic_c_check_header = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" CtrlP
let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" NerdTree
map <C-f> :NERDTreeToggle<CR>
" | Automatically opened when vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" | Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
