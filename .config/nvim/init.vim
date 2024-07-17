" =======================
"         Common
" =======================
"
set encoding=utf-8
set fileformat=unix
set foldmethod=indent
set foldnestmax=1
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nnoremap <S-Down> <C-D>
inoremap <S-Down> <C-O><C-D>
nnoremap <S-Up>   <C-U>
inoremap <S-Up>   <C-O><C-U>

nnoremap <C-Q> ^
inoremap <C-Q> <Home>
nnoremap <S-Left> ^
inoremap <S-Left> <Home>
nnoremap <S-Right> $
inoremap <S-Right> <End>
nnoremap <C-E> $
inoremap <C-E> <End>
" Cut before & after the cursor
nnoremap ds d^
nnoremap df d$
" Go to insert mode and delete char
noremap <Del> i<Right><BS>
" Erase
noremap x "_d
noremap xx "_dd
" Erase before & after the cursor
noremap xz "_d^
noremap xc "_d$
" Yank before & after the cursor
nnoremap yt y^
nnoremap yu y$

" =======================
"    VSCode Specific
" =======================
"
let g:cfgdir = "${XDG_CONFIG_HOME}/nvim"
if(exists("g:vscode"))
    " Yank/Del copies to clipboard
    "set clipboard=unnamedplus
    exec "source " . g:cfgdir . "/vscode.vim"
else
    exec "source " . g:cfgdir . "/nvim.vim"
    exec "source " . g:cfgdir . "/plugins.vim"
    exec "source " . g:cfgdir . "/plugin-settings.vim"
    syntax on
endif
