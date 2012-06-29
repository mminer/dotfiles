set nocompatible

" Support Pathogen plugin
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on

set number             " Line numbers
set relativenumber     " Relative line numbers
set showcmd            " Show command being typed
set cursorline         " Highlight current line
set autoindent         " Autoindentation
set autoread           " Reload file when it's modified from elsewhere
set laststatus=2       " Always show the status line
set encoding=utf-8     " Necessary to show unicode glyphs
set ignorecase         " Ignore case in searches
set smartcase          " Use case-sensitive search when a letter is capitalized
set incsearch          " Highlight search results
set showmatch
set hlsearch
set tabstop=4          " 4 spaces per tab
set softtabstop=4
set shiftwidth=4
set noexpandtab        " Insert actual tab character when tab key is pressed
set wrap               " Handle long lines correctly
set textwidth=79
set colorcolumn=80
set formatoptions=qrn1
set noswapfile         " Disable swap files
set nobackup
set nowb
set foldmethod=indent  " Code folding
set foldlevel=99
set clipboard=unnamed  " Use system clipboard for yank/put operation
set bs=2               " Restore backspace key
set mouse=a            " Enable mouse support in console
set hidden             " Hide buffers when they're abandoned
set secure             " Prevent other .vimrc files from overriding
set t_Co=256           " Let vim know our terminal is capable of 256 colours
colorscheme molokai    " Set colour scheme

" Use TextMate-style invisible characters
set listchars=tab:▸\ ,eol:¬

" Tab completion
set wildmenu
set wildmode=list:longest,full

" Ignore certain files in tools like ctrlp
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,.*

" Use English for spellchecking, but disable spellchecking by default
if version >= 700
	set spl=en spell
	set nospell
endif

" Syntax highlighting
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

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

" Fast .vimrc access
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>o :source ~/.vimrc<cr>

" NERDTree settings
nnoremap <leader>b :NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore certain files

" Remap task list to \d ("to [d]o")
map <leader>d <Plug>TaskList

" Toggle invisible characters
nnoremap <leader>i :set list!<cr>

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

" CtrlP settings
nnoremap <leader>t :CtrlP<cr>
let g:ctrlp_by_filename = 1       " Default to filename mode
let g:ctrlp_working_path_mode = 0 " Don't manage working directory

let g:syntastic_auto_loc_list=1

