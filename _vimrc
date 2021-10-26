" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

call plug#begin('~/.vim/vim82/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ervandew/supertab'

call plug#end()


" Vim-startify custom header
let g:startify_custom_header = [
     \'      ________  ___      ___  __     ___      ___                    ',
     \'     /"       )|"  \    /"  ||" \   |"  \    /"  |                   ',
     \'    (:   \___/  \   \  //  / ||  |   \   \  //   |                   ',
     \'     \___  \     \\  \/. ./  |:  |   /\\  \/.    |                   ',
     \'      __/  \\     \.    //   |.  |  |: \.        |                   ',
     \'     /" \   :)     \\   /    /\  |\ |.  \    /:  |                   ',
     \'    (_______/       \__/    (__\_|_)|___|\__/|___|  - PaleNightTheme ',
     \]                                      

" Vim-startify lists
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" NerdTree stuff
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.rkt,*.h
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix | 

set encoding=utf-8

syntax on

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'palenight'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if has('gui_running')
    set guifont=DejaVu\ Sans:s13
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

highlight Comment cterm=italic gui=italic

set laststatus=2
" set showtabline=2

" true colours
set background=dark
set t_Co=256

if (has("termguicolors"))
  set termguicolors
endif

colorscheme palenight
let g:palenight_terminal_italics=1

set nu rnu
set clipboard=unnamed
set ruler
set showcmd
set noswapfile
set noshowmode
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searcher
" clears highlights
nnoremap // :noh<return> 

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" code compiler
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <C-/> :w <bar> :!python % <cr>
    autocmd filetype cpp nnoremap <C-/> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && %:r.exe <CR>
    autocmd filetype c nnoremap <C-/> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <C-/> :w <bar> !javac % && java %:r <cr>
augroup END

