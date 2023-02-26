function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&runtimepath, trim(g:plugs[a:name].dir, "/")) >= 0)
endfunction

if PlugLoaded("molokai")
    colorscheme molokai
endif

if PlugLoaded("syntastic")
    let g:syntastic_c_checkers = ['checkpatch', 'gcc']
    let g:syntastic_c_check_header = 1
endif

if PlugLoaded("tagbar")
    nmap <F2> :TagbarToggle<CR>

    " Tagbar automatically updates its buffer every 'updatetime' which is by
    " default 4s, which is actually slow.
    set updatetime=1000

    let g:tagbar_width=80
    autocmd FileType python,c,cpp TagbarOpen
endif

if PlugLoaded("vim-snippets")
    let g:snips_author="Thomas \"Ventto\" Venriès"
    let g:snips_email="thomas.venries@gmail.com"
    let g:snips_github="https://github.com/Ventto"
endif

if PlugLoaded("ultisnips")
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
endif

if PlugLoaded("ctrlp.vim")
    let g:ctrlp_cmd='CtrlP :pwd'
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
endif

if PlugLoaded("nerdtree")
    map <F1> :NERDTreeToggle<CR>
    " | Automatically opened when vim starts up with no file specified
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " | Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " | Update NERDTree automatically
    "autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w
endif

if PlugLoaded("vim-devicons")
    let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
    let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

    let g:NERDTreeDisableFileExtensionHighlight = 1
    let g:NERDTreeDisableExactMatchHighlight = 1
    let g:NERDTreeDisablePatternMatchHighlight = 1

    " you can add these colors to your .vimrc to help customizing
    let s:brown = "905532"
    let s:aqua =  "3AFFDB"
    let s:blue = "689FB6"
    let s:darkBlue = "44788E"
    let s:purple = "834F79"
    let s:lightPurple = "834F79"
    let s:red = "AE403F"
    let s:beige = "F5C06F"
    let s:yellow = "F09F17"
    let s:orange = "D4843E"
    let s:darkOrange = "F16529"
    let s:pink = "CB6F6F"
    let s:salmon = "EE6E73"
    let s:green = "8FAA54"
    let s:lightGreen = "31B53E"
    let s:white = "FFFFFF"
    let s:rspec_red = 'FE405F'
    let s:git_orange = 'F54D27'

    let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

    let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

    let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
    let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

    let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
    let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
endif

if PlugLoaded("nerdcommenter")
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1
    " Enable NERDCommenterToggle to check all selected lines is commented or not
    let g:NERDToggleCheckAllLines = 1
endif

if PlugLoaded("SimpylFold")
    let g:SimpylFold_docstring_preview=1
endif

if PlugLoaded("vim-expand-region")
    map ù <Plug>(expand_region_expand)
    map * <Plug>(expand_region_shrink)
endif

if PlugLoaded("lightline.vim")
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
