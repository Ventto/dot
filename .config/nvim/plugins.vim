let g:bundle_dir = config_dir . "/bundle"

" #===========================#
"           Loading
" #===========================#

filetype off
call plug#begin(bundle_dir)

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
" Syntaxs
Plug 'peterhoeg/vim-qml'
" Internal sudo edition (https://github.com/neovim/neovim/issues/8527)
Plug 'lambdalisue/suda.vim'
" Robot Framework syntax"
Plug 'mfukar/robotframework-vim'
" Latex
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'

call plug#end()
filetype plugin indent on

" #===========================#
"          Functions
" #===========================#

function PlugExists(name)
    if isdirectory(g:bundle_dir . "/" . a:name)
        return 1
    else
        echo a:name . ": plugin not found"
    endif
endfunction

" #===========================#
"           Settings
" #===========================#

if PlugExists("molokai")
    colo molokai
endif

if PlugExists("syntastic")
    let g:syntastic_c_checkers = ['checkpatch', 'gcc']
    let g:syntastic_c_check_header = 1
endif

if PlugExists("tagbar")
    nmap <F8> :TagbarToggle<CR>

    " Tagbar automatically updates its buffer every 'updatetime' which is by
    " default 4s, which is actually slow.
    set updatetime=1000
endif

if PlugExists("ultisnips")
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
endif

if PlugExists("ctrlp.vim")
    let g:ctrlp_cmd='CtrlP :pwd'
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
endif

if PlugExists("nerdtree")
    map <C-f> :NERDTreeToggle<CR>
    " | Automatically opened when vim starts up with no file specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " | Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

if PlugExists("SimpylFold")
    let g:SimpylFold_docstring_preview=1
endif

if PlugExists("vim-expand-region")
    map ù <Plug>(expand_region_expand)
    map * <Plug>(expand_region_shrink)
endif

if PlugExists("lightline.vim")
    let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'lineinfo' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
          \   'right': [ [ 'syntastic', 'maxlineinfo', 'modified' ],
          \              [ 'percent' ],
          \              [ 'fileformat', 'fileencoding',
          \                'filetype', 'charvaluehex' ] ]
          \ },
          \ 'component_function': {
          \   'gitbranch': 'fugitive#head',
          \   'maxlineinfo': "MaxLineInfo",
          \ },
          \ }
    function! MaxLineInfo()
      return line('.') . '/' . line('$')
    endfunction
endif
