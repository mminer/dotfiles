set nocompatible

" Read bundles from separate file
if filereadable(expand('~/.vimrc.bundles'))
    source ~/.vimrc.bundles
endif

filetype plugin indent on

" General settings
set number              " Show line numbers
set relativenumber      " Use relative line numbers
set showcmd             " Show command being typed
set cursorline          " Highlight current line
set autoindent          " Automatically match indentation on newline
set autoread            " Reload file when it's modified from elsewhere
set laststatus=2        " Always show the status line
set encoding=utf-8      " Necessary to show unicode glyphs
set ignorecase          " Ignore case in searches
set smartcase           " Case-sensitive search when a letter is capitalized
set hlsearch            " Highlight search results
set incsearch           " 'Live' search; highlight results as they are typed
set showmatch           " Jump to the matching bracket when one's inserted
set tabstop=4           " 4 spaces per tab
set softtabstop=4
set shiftwidth=4
set noexpandtab         " Insert actual tab character when tab key is pressed
set wrap                " Wrap long lines
set textwidth=79        " Wrap lines after 79 characters
set colorcolumn=80      " Display page guide
set noswapfile          " Disable swap files
set nobackup            " Disable backup files
set foldmethod=indent   " Fold based on equal indentation
set foldlevel=99        " Open all folds when loading a file
set clipboard=unnamed   " Use system clipboard for yank/put operation
set backspace=2         " Restore backspace key functionality
set mouse=a             " Enable mouse support in console
set hidden              " Hide buffers when they're abandoned
set secure              " Prevent other .vimrc files from overriding this one
set scrolloff=3         " Force space above and below cursor
set t_Co=256            " Let vim know our terminal is capable of 256 colours
set formatoptions=qron1 " Text formatting options
colorscheme molokai     " Set colour scheme

" Syntax highlighting
filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*

" Use TextMate-style invisible characters
set listchars=tab:▸\ ,eol:¬

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Ignore certain files in tools like ctrlp
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta

" Use English for spellchecking, but disable spellchecking by default
if version >= 700
	set spl=en spell
	set nospell
endif

" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Move file screen line rather than file line
nnoremap j gj
nnoremap k gk

" Clear search highlights
nnoremap <leader><space> :noh<cr>

" Toggle invisible characters
nnoremap <leader>i :set list!<cr>

" Fast .vimrc access
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>o :source ~/.vimrc<cr>
" Easily switch between standard and relative line numbers
function! ToggleRelativeLineNumber()
	if (&number == 1)
		set nonumber
		set relativenumber
	else
		set number
		set norelativenumber
	endif
endfunction
nnoremap <leader>r :call ToggleRelativeLineNumber()<CR>

" Remove trailing whitespace on save
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Use a darker red to highlight errors
highlight SpellBad ctermbg=52

" NERDTree shortcuts
nnoremap <leader>b :NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore certain files

" Remap task list to \d ("to [d]o")
nnoremap <leader>d <Plug>TaskList

" CtrlP settings
nnoremap <leader>t :CtrlP<cr>
let g:ctrlp_working_path_mode = 0 " Don't manage working directory

let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['html']}

