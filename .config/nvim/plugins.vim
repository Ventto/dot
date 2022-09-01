let g:bundle_dir = $HOME . "/.config/nvim/bundle/"
filetype off
call plug#begin(bundle_dir)
" == Configuration ==
Plug 'editorconfig/editorconfig-vim'
" Internal sudo edition (https://github.com/neovim/neovim/issues/8527)
Plug 'lambdalisue/suda.vim'

" == UI ==
Plug 'tomasr/molokai'
" A tree explorer plugin
Plug 'scrooloose/nerdtree'
" Show a diff in the sign column
Plug 'mhinz/vim-signify'
" IDE-like tabs
Plug 'kien/tabman.vim'
" A minimal, stylish and customizable statusline for Neovim written in Lua
Plug 'famiu/feline.nvim'
" Configurable statusline/tabline plugin
Plug 'itchyny/lightline.vim'
" Displays tags in a window
Plug 'majutsushi/tagbar'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" == Syntax Hightlighter ==
Plug 'peterhoeg/vim-qml'
Plug 'martinlroth/vim-acpi-asl'
Plug 'mfukar/robotframework-vim'
Plug 'LnL7/vim-nix'
Plug 'lervag/vimtex'

" == Content ==
" Snippet engine (FIXME)
Plug 'SirVer/ultisnips'
" Snippet templates
Plug 'honza/vim-snippets'
" Text Prediction
Plug 'tabnine/YouCompleteMe'
" Cscope maps plugin
Plug 'chazy/cscope_maps'
" Comment / uncomment lines regarding the filetype
Plug 'scrooloose/nerdcommenter'
" Latex
Plug 'matze/vim-tex-fold'
" Folds Python code
Plug 'tmhedberg/SimpylFold'
" Increasing and decreasing columns of numbers, dates or daynames
Plug 'vim-scripts/VisIncr'
" Allows multiple selections
Plug 'terryma/vim-multiple-cursors'
" Make your Nvim as smart as VSCode, snippet & additional text editing support
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Visually selects increasingly larger regions
Plug 'terryma/vim-expand-region'
" Syntax checking hacks
Plug 'vim-syntastic/syntastic'

" == Git ==
" Git wrapper so awesome
Plug 'tpope/vim-fugitive'

" == Optimization ==
" Speed up neovim startup time
Plug 'nathom/filetype.nvim'

call plug#end()
filetype plugin indent on
