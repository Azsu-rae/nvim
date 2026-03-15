
set textwidth=114

set laststatus=3
set splitbelow
set cursorline
set nowrap

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set relativenumber
set signcolumn=yes

set hlsearch
set smartcase
set ignorecase
set incsearch

set belloff=all
set termguicolors

let mapleader = " "

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

vnoremap <leader>y "+y
nnoremap <leader>y "+y

nnoremap <leader>b <CMD>buffer #<CR>
nnoremap <leader>t <CMD>split <BAR> term<CR>i
