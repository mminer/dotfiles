set nocompatible
source .vimrc.keybindings
source .vimrc.plugins

" General
set autoindent
set autoread
set backspace=indent,eol,start
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
set incsearch
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
set ttimeout
set ttimeoutlen=100
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules,bower_components
set wildmenu
set wildmode=list:longest,full

" Remove trailing whitespace on save.
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * %s/\s\+$//e

" Colours
colorscheme molokai
autocmd ColorScheme * highlight Normal ctermbg=None ctermfg=White
syntax on
