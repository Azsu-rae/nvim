
colorscheme habamax

lua require('vim._core.ui2').enable()

lua require('autocmds')
lua require('plugins')

lua vim.lsp.enable(require('languages').LSPs)
lua vim.diagnostic.config { virtual_text = true }

""""""""""""""""""""""""""""""""""""""""
" OPTIONS

" treesitter seems to sets foldexpr automatically
set foldmethod=expr
set foldlevel=99



set path+=**
set wildignorecase

set nowrap
set cursorline

set relativenumber
set number
set signcolumn=yes
set laststatus=3

set splitbelow

set complete+=o
" set autocomplete -- is bugged somehow

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

""""""""""""""""""""""""""""""""""""""""
" MAPPINGS

" let mapleader = " "

nnoremap <M-h> 3zh
nnoremap <M-l> 3zl
