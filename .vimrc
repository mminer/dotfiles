set nocompatible


" General:

set clipboard=unnamed
set colorcolumn=+1
set cursorline
set expandtab
set fillchars+=vert:│ " https://vi.stackexchange.com/a/2942
set foldlevel=99
set foldmethod=indent
set formatoptions=cqn
set hidden
set hlsearch
set ignorecase
set listchars=tab:▸\ ,eol:¬
set mouse=a
set nofoldenable
set noshowmode
set noswapfile
set rtp+=/usr/local/opt/fzf
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set softtabstop=-1
set textwidth=80
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules,bower_components
set wildmode=list:longest,full

" Remove trailing whitespace on save.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * %s/\s\+$//e


" Key Bindings:

let mapleader = " "
inoremap jj <Esc>

" Move file screen line rather than file line.
noremap j gj
noremap k gk

" Disable going to ex mode.
noremap Q gq

" Yank from cursor to end of line, to be consistent with C and D.
noremap Y y$

" Move between tabs and split windows using arrow keys.
noremap <up>    <C-w>k
noremap <down>  <C-w>j
noremap <left>  <C-w>h
noremap <right> <C-w>l

" Create new split windows easier.
noremap <leader>- :split<cr>
noremap <leader>= :vsplit<cr>

noremap <leader>; :Buffers<cr>
noremap <leader>m :marks<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>t :Files<cr>
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>w :set wrap!<cr>

" Toggle invisible characters.
noremap <leader>i :set list!<cr>

" Clear search highlights.
noremap <leader><leader><leader> :noh<cr>


" Custom Commands:

com! FormatJSON %!python -m json.tool


" Plugins:

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'takac/vim-commandcaps'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-markdown'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'ethereum/vim-solidity'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'keith/swift.vim'
Plug 'mbbill/undotree'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', 'maxlinenr'])
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'molokai'
let g:ale_linters = { 'cs': [], 'html': [], 'swift': [] }
let g:jsx_ext_required = 0
let g:SuperTabDefaultCompletionType = 'context'


" Colours:

colorscheme molokai
autocmd ColorScheme * highlight Normal ctermbg=None ctermfg=White
