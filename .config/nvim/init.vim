set nocompatible
set viminfo=
filetype off

call plug#begin("~/.config/nvim/bundle")

" Edition
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'vim-syntastic/syntastic'
" Interface
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
" Git
Plug 'tpope/vim-fugitive'
" Python
Plug 'tmhedberg/SimpylFold'

call plug#end()

filetype plugin indent on
syntax on

" #===========================#
"            Basic
" #===========================#

set autoindent
set backspace=2
set cc=79
set cursorline
set encoding=utf-8
set fileformat=unix
set foldmethod=indent
set foldnestmax=1
set laststatus=2
set mouse=a
set number relativenumber
set ruler
set scrolloff=15
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
set wildmenu
set wildmode=list:longest,full

colorscheme molokai
cnoreabbrev w!! w !sudo tee % > /dev/null

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
"           Plugins
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

" SimplyFold
let g:SimpylFold_docstring_preview=1
