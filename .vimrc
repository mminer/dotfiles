set nocompatible


" General:

set clipboard=unnamed
set cursorline
set expandtab
set foldlevel=99
set foldmethod=indent
set foldopen=""
set formatoptions=cqn
set hidden
set hlsearch
set ignorecase
set infercase
set listchars=tab:▸\ ,eol:¬
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
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,*.unity,.*,venv,*.meta,*.pdf,*.prefab,*.psd,*.fbx,*.mat,node_modules,bower_components
set wildmode=list:longest,full

" Enable dynamic popovers. Used by ALE to display type info on mouse hover.
set ballooneval
set balloonevalterm

" Use full-height dividers for split windows.
" https://vi.stackexchange.com/a/2942
set fillchars+=vert:│

" Use ripgrep for search.
" https://github.com/BurntSushi/ripgrep/issues/425#issuecomment-381446152
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Recommended by vim-gitgutter to show signs faster.
" https://github.com/airblade/vim-gitgutter#when-signs-take-a-few-seconds-to-appear
set updatetime=100


" Key Bindings:

let mapleader = " "
inoremap jj <Esc>

" Move file screen line rather than file line.
noremap j gj
noremap k gk

" Yank from cursor to end of line, to be consistent with C and D.
noremap Y y$

" Move between tabs and split windows using arrow keys.
nmap <up>    <C-w>k
nmap <down>  <C-w>j
nmap <left>  <C-w>h
nmap <right> <C-w>l

" Create new split windows easier.
nmap <silent> <leader>- :split<cr>
nmap <silent> <leader>= :vsplit<cr>

nmap <leader>; :Buffers<cr>
nmap <leader>/ :ALEHover<cr>
nmap <leader>d :ALEGoToDefinition<cr>
nmap <leader>g :GitGutterFold<cr>
nmap <leader>m :marks<cr>
nmap <leader>r :ALEFindReferences<cr>
nmap <leader>s <Plug>DashSearch
nmap <leader>t :Files<cr>

" Clear search highlights.
nmap <leader><leader><leader> :nohlsearch<cr>

" Navigate between ALE errors using control+j and control+k.
" https://github.com/w0rp/ale#5ix-how-can-i-navigate-between-errors-quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Automatically expand path of active buffer with %%.
" From Practical Vim, tip 42.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Automatically reuse last flags when repeating substitution via :&.
" From Practical Vim, tip 93.
nnoremap & :&&<CR> xnoremap & :&&<CR>


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

" Has to be set before ALE loads.
let g:ale_set_balloons = 1

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'beyondmarc/hlsl.vim'
Plug 'tomasr/molokai'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'

" Fixes mistyped capitalized commands. :W becomes :w, :Q becomes :q, and so on.
Plug 'takac/vim-commandcaps'

" Commands for common file operations: Delete, Rename, Move, etc.
Plug 'tpope/vim-eunuch'

" Enables mouse support and shows thin cursor in insert mode.
Plug 'wincent/terminus'

" Integrate with Git. Rhubarb enables fugutive.vim's :Gbrowse for GitHub.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

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
\   'typescriptreact': ['prettier'],
\}
let g:ale_linters = {
\   'cpp': ['ccls', 'clang', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'flawfinder'],
\   'cs': [],
\   'html': [],
\}
let g:ale_linters_ignore = {
\   'javascript': ['tslint', 'tsserver'],
\   'javascriptreact': ['tslint', 'tsserver'],
\}
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


" File Types:

" Reformat Markdown files to fit within 80 characters via :gq.
" https://thoughtbot.com/blog/wrap-existing-text-at-80-characters-in-vim
au BufRead,BufNewFile *.md setlocal textwidth=80

au BufRead,BufNewFile *.uxml set filetype=xml
