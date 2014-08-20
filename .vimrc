set nocompatible

" Read bundles from separate file.
if filereadable(expand('~/.vimrc.bundles'))
    source ~/.vimrc.bundles
endif


" ================ General ===========================

set autoindent          " Match indentation on newline
set autoread            " Reload file when it's modified externally
set backspace=2         " Restore backspace key functionality
set cursorline          " Highlight current line
set laststatus=2        " Always show status line
set foldmethod=indent   " Fold based on equal indentation
set foldlevel=99        " Open all folds when loading a file
set formatoptions=tcqn  " Enable various text formatting options
set hidden              " Hide buffers when they're abandoned
set mouse=a             " Enable mouse support in console
set nobackup            " Disable backup files
set noshowmode          " Hide mode text (e.g. -- INSERT --) below status line
set noswapfile          " Disable swap files
"set number              " Display line numbers
set scrolloff=3         " Force space above and below cursor
set secure              " Prevent other .vimrc files from overriding this one
set showcmd             " Display command being typed
set showmatch           " Show matching brackets / parentheses
set spl=en              " Use English for spellchecking
set t_Co=256            " Let vim know our terminal is capable of 256 colours
set textwidth=79        " Wrap lines after 79 characters
set wildmenu            " Tab completion
set wildmode=list:longest,full
set wrap                " Wrap long lines

if $TMUX == ''
    set clipboard=unnamed   " Use system clipboard for yank and put operations
endif

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
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules

colorscheme molokai

" Set vim 7.3-specific options.
if v:version >= 703
    set colorcolumn=80  " Display page guide
    "set relativenumber  " Use relative line numbers

    " Switch between standard and relative line numbers.
    function! ToggleRelativeLineNumber()
        if (&number == 1)
            set nonumber relativenumber
        else
            set number norelativenumber
        endif
    endfunction

    nnoremap <leader>r :call ToggleRelativeLineNumber()<cr>
endif

" Turn on syntax highlighting.
filetype plugin indent on
syntax enable

" Remove trailing whitespace on save.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Add HiveQL script extension
au BufRead,BufNewFile *.hql set filetype=sql


" ================ Custom Keybindings ================

" Move file screen line rather than file line.
nnoremap j gj
nnoremap k gk

" Yank from cursor to end of line, to be consistent with C and D.
nnoremap Y y$

" Move between tabs and split windows using arrow keys.
nnoremap <up>    <C-w>k
nnoremap <down>  <C-w>j
nnoremap <left>  <C-w>h
nnoremap <right> <C-w>l

" Create new split windows easier.
nnoremap <leader>- :split<cr>
nnoremap <leader>= :vsplit<cr>

" Clear search highlights.
nnoremap <leader><space> :noh<cr>

" Fast .vimrc access.
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>o :source ~/.vimrc<cr>

" Show marks.
nnoremap <leader>m :marks<cr>

" Toggle invisible characters.
nnoremap <leader>i :set list!<cr>

" Toggle wrapping.
nnoremap <leader>w :setlocal wrap!<cr>:setlocal wrap?<cr>

" Toggle paste mode.
set pastetoggle=<leader>p


" ================ Plugins ===========================

let g:ctrlp_working_path_mode = 0      " Don't manage working directory
let g:syntastic_auto_loc_list = 1      " Open error window automatically
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['html']}
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Replace status line with Powerline.
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
