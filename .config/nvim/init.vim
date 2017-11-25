set nocompatible
set viminfo=
filetype off

call plug#begin("~/.config/nvim/bundle")

" Color scheme
Plug 'tomasr/molokai'
" Snippet engine
Plug 'SirVer/ultisnips'
" Snippet templates
Plug 'honza/vim-snippets'
" Displays tags in a window
Plug 'majutsushi/tagbar'
" Show a diff in the sign column
Plug 'mhinz/vim-signify'
" Syntax checking hacks
Plug 'vim-syntastic/syntastic'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
" A tree explorer plugin
Plug 'scrooloose/nerdtree'
" Visually selects increasingly larger regions
Plug 'terryma/vim-expand-region'
" Allows multiple selections
Plug 'terryma/vim-multiple-cursors'
" Git wrapper so awesome
Plug 'tpope/vim-fugitive'
" Folds Python code
Plug 'tmhedberg/SimpylFold'
" Configurable statusline/tabline plugin
Plug 'itchyny/lightline.vim'
" Increasing and decreasing columns of numbers, dates or daynames
Plug 'vim-scripts/VisIncr'

call plug#end()

filetype plugin indent on
syntax on

" #===========================#
"            Minimal
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

colo molokai

" Save changes using sudo without involving nvim
cnoreabbrev w!! w !sudo tee % > /dev/null

" Column limit
hi OverLength ctermbg=red ctermfg=black
match OverLength /\%80v.\+/

" Deletes EOL spaces
autocmd BufWritePre * :%s/\s\+$//e

" Additional filetype
au! BufRead,BufNewFile *.gdb            set filetype=gdb
au! BufRead,BufNewFile Makefile.*       set filetype=make
au! BufRead,BufNewFile ~/.config/zsh/*  set filetype=zsh

" Collapse or expand
map , zr
map ; zm

" #===========================#
"          Syntastic
" #===========================#

let g:syntastic_c_checkers = ['checkpatch', 'gcc']
let g:syntastic_c_check_header = 1

" #===========================#
"           Tagbar
" #===========================#

nmap <F8> :TagbarToggle<CR>

" #===========================#
"          Ultisnips
" #===========================#

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" #===========================#
"            CtrlP
" #===========================#

let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" #===========================#
"           NerdTree
" #===========================#

map <C-f> :NERDTreeToggle<CR>
" | Automatically opened when vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" | Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" #===========================#
"          SimplFold
" #===========================#

let g:SimpylFold_docstring_preview=1

" #===========================#
"        Expand Region
" #===========================#

map ù <Plug>(expand_region_expand)
map * <Plug>(expand_region_shrink)

" #===========================#
"          Light Line
" #===========================#

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [  'syntastic', 'maxlineinfo'  ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'maxlineinfo': "MaxLineInfo",
      \ },
      \ }
function! MaxLineInfo()
  return line('.') . '/' . line('$')
endfunction
