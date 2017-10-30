set nocompatible
set rtp+=/usr/local/opt/fzf

" Read bundles from separate file.
if filereadable(expand('~/.vimrc.bundles'))
    source ~/.vimrc.bundles
endif


" General
set autoindent          " Match indentation on newline
set autoread            " Reload file when it's modified externally
set backspace=2         " Restore backspace key functionality
set clipboard=unnamed   " Use system clipboard for yank and put operations
set colorcolumn=80      " Display page guide
set cursorline          " Highlight current line
set laststatus=2        " Always show status line
set foldmethod=indent   " Fold based on equal indentation
set foldlevel=99        " Open all folds when loading a file
set formatoptions=cqn   " Enable various text formatting options
set hidden              " Hide buffers when they're abandoned
set mouse=a             " Enable mouse support in console
set nobackup            " Disable backup files
set noshowmode          " Hide mode text (e.g. -- INSERT --) below status line
set noswapfile          " Disable swap files
set scrolloff=3         " Force space above and below cursor
set secure              " Prevent other .vimrc files from overriding this one
set showcmd             " Display command being typed
set showmatch           " Show matching brackets / parentheses
set spl=en              " Use English for spellchecking
set t_Co=256            " Let vim know our terminal is capable of 256 colours
set textwidth=79        " Wrap lines after 79 characters
set wildmenu            " Tab completion
set wildmode=list:longest,full
set wrap                " Visually wrap long lines

" Search
set hlsearch            " Highlight search results
set ignorecase          " Ignore case in searches
set incsearch           " Highlight results as they're typed ("live" sarch)
set smartcase           " Search case-sensitive when a letter is capitalized

" Tabs
set expandtab           " Use spaces instead of tabs
set tabstop=4           " 4 spaces per tab
set softtabstop=4
set shiftwidth=4

" Use TextMate-style invisible characters.
set listchars=tab:▸\ ,eol:¬

" Ignore junk files.
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules,bower_components

" Turn on syntax highlighting.
filetype plugin indent on
syntax enable

" Remove trailing whitespace on save.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


" Custom Keybindings:

let mapleader = "\<Space>"
inoremap jj <Esc>

" Move file screen line rather than file line.
nnoremap j gj
nnoremap k gk

" Disable going to ex mode.
nnoremap Q <Nop>

" Yank from cursor to end of line, to be consistent with C and D.
nnoremap Y y$

" Move between tabs and split windows using arrow keys.
nnoremap <up>    <C-w>k
nnoremap <down>  <C-w>j
nnoremap <left>  <C-w>h
nnoremap <right> <C-w>l

" Clear search highlights.
nnoremap <leader><leader><leader> :noh<cr>

" Create new split windows easier.
nnoremap <leader>- :split<cr>
nnoremap <leader>= :vsplit<cr>

" Toggle invisible characters.
nnoremap <leader>i :set list!<cr>

" Show marks.
nnoremap <leader>m :marks<cr>

" Toggle NERDTree.
nnoremap <leader>n :NERDTreeToggle<cr>

" Open file finder.
nnoremap <leader>; :Buffers<cr>
nnoremap <leader>t :Files<cr>

" Toggle undo tree.
nnoremap <leader>u :UndotreeToggle<cr>

" Toggle wrapping.
nnoremap <leader>w :setlocal wrap!<cr>:setlocal wrap?<cr>


" Plugins:

let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:ale_linters = { 'cs': [], 'html': [] }
let g:jsx_ext_required = 0
let g:SuperTabDefaultCompletionType = 'context'

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete


" Colours:

colorscheme molokai
autocmd ColorScheme * highlight Normal ctermbg=None ctermfg=White
syntax enable
