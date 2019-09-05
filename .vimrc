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
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set softtabstop=-1
set textwidth=80
set updatetime=100 " Recommended by vim-gitgutter
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules,bower_components
set wildmode=list:longest,full


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
noremap <leader>d :ALEGoToDefinition<cr>
noremap <leader>g :GitGutterFold<cr>
noremap <leader>h :ALEHover<cr>
noremap <leader>m :marks<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>r :ALEFindReferences<cr>
noremap <leader>t :Files<cr>
noremap <leader>u :UndotreeToggle<cr>
noremap <leader>w :set wrap!<cr>

" Toggle invisible characters.
noremap <leader>i :set list!<cr>

" Clear search highlights.
noremap <leader><leader><leader> :noh<cr>

" Allow typing lowercase rg to trigger Ripgrep search.
cnoreabbrev rg Rg

" Navigate between ALE errors using control+j and control+k.
" https://github.com/w0rp/ale#5ix-how-can-i-navigate-between-errors-quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Custom Commands:

com! FormatJSON %!python -m json.tool


" Plugins:

" Automatically install Vim Plug if it's not already installed.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'

call plug#end()

" Ensure Vim can find fzf; see https://github.com/junegunn/fzf#as-vim-plugin.
set rtp+=/usr/local/opt/fzf " If installed using Homebrew
set rtp+=~/.fzf             " If installed using Git

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#cursormode#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1
let g:airline_symbols = get(g:,'airline_symbols',{})
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'molokai'
let g:ale_cpp_clang_options = '-Wall -std=c++17'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_linters = { 
\   'cpp': ['ccls', 'clang', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'flawfinder'], 
\   'cs': [], 
\   'html': [], 
\   'swift': [],
\}
let g:ale_linters_ignore = {'javascript': ['tslint', 'tsserver']}
let g:jsx_ext_required = 0
let g:SuperTabDefaultCompletionType = 'context'

let g:cursormode_color_map = {
\   'nlight': '#000000',
\   'ndark': '#BBBBBB',
\   'i': g:airline#themes#{g:airline_theme}#palette.insert.airline_a[1],
\   'R': g:airline#themes#{g:airline_theme}#palette.replace.airline_a[1],
\   'v': g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\   'V': g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\   '\<C-V>': g:airline#themes#{g:airline_theme}#palette.visual.airline_a[1],
\}

set omnifunc=ale#completion#OmniFunc


" Colours:

colorscheme molokai
autocmd ColorScheme * highlight Normal ctermbg=none ctermfg=white
set background=dark
