#!/usr/bin/env bash

plugins_path="$HOME/.vim/pack/mminer/start"
mkdir -p "${plugins_path}"

function get() {
    url=$1
    name=$(basename "${url}" .git)
    path="${plugins_path}/${name}"

    if [[ -d "${path}" ]]; then
        echo "Updating ${name}"
        git -C "${path}" pull
    else
        echo "Cloning $name"
        git clone "${url}" "${path}"
    fi
}

get "https://github.com/editorconfig/editorconfig-vim.git"
get "https://github.com/ervandew/supertab.git"
get "https://github.com/github/copilot.vim.git"
get "https://github.com/junegunn/fzf.vim.git"
get "https://github.com/nelstrom/vim-visual-star-search.git"
get "https://github.com/sheerun/vim-polyglot.git"
get "https://github.com/tomasr/molokai.git"
get "https://github.com/tpope/vim-commentary.git"
get "https://github.com/tpope/vim-dispatch.git"
get "https://github.com/tpope/vim-repeat.git"
get "https://github.com/tpope/vim-sensible.git"
get "https://github.com/tpope/vim-surround.git"
get "https://github.com/tpope/vim-unimpaired.git"
get "https://github.com/vim-airline/vim-airline-themes.git"
get "https://github.com/vim-airline/vim-airline.git"
get "https://github.com/w0rp/ale.git"

# Fixes mistyped capitalized commands. :W becomes :w, :Q becomes :q, and so on.
get "https://github.com/takac/vim-commandcaps.git"

# Commands for common file operations: Delete, Rename, Move, etc.
get "https://github.com/tpope/vim-eunuch.git"

# Enables mouse support and shows thin cursor in insert mode.
get "https://github.com/wincent/terminus.git"

# Integrate with Git. Rhubarb enables fugutive.vim's :Gbrowse for GitHub.
get "https://github.com/airblade/vim-gitgutter.git"
get "https://github.com/tpope/vim-fugitive.git"
get "https://github.com/tpope/vim-rhubarb.git"
