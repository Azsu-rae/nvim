
colorscheme catppuccin
lua require('vim._core.ui2').enable()

let mapleader = " "

lua require('plugins')
lua require('autocmds')
lua require('config.neovide')

lua vim.lsp.enable(require('languages').LSPs)
lua vim.diagnostic.config { virtual_text = true }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS

" treesitter seems to sets foldexpr automatically
set foldmethod=expr
set foldlevel=99

set path+=**
set wildignorecase
set wildignore+=*.class,*.jar,**/node_modules/**

set nowrap
set cursorline

set relativenumber
set number
set signcolumn=yes
set laststatus=3

set splitbelow
set splitright

set complete+=o
"set completeopt+=noselect
"set autocomplete

set ignorecase
set smartcase

" for automatic saving when running :make
set autowrite

set expandtab
set shiftwidth=4    " seems to set for beginning of the line <TAB>
set tabstop=4       " seems to set for middle of the line <TAB>

set scrolloff=3
set sidescrolloff=3

set sidescroll=0

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

set confirm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS

nnoremap <ESC> <CMD>noh<CR>

nnoremap <M-h> 3zh
nnoremap <M-l> 3zl

nnoremap <M-ScrollWheelUp> 5zh
nnoremap <M-ScrollWheelDown> 5zl

tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <M-h> <LEFT>
tnoremap <M-l> <RIGHT>
tnoremap <M-k> <UP>
tnoremap <M-j> <DOWN>
tnoremap <C-M-h> <C-LEFT>
tnoremap <C-M-l> <C-RIGHT>
tnoremap <C-M-k> <C-UP>
tnoremap <C-M-j> <C-DOWN>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
