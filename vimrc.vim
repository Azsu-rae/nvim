
set textwidth=150
set wildignorecase

set laststatus=3
set splitbelow
set nocursorline
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

nnoremap <leader>b <CMD>b #<CR>
nnoremap <leader>t <CMD>split <BAR> term<CR>i
