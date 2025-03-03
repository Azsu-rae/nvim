
vim.env.R_LIBS_USER = "C:/Users/aitam/AppData/Local/R/win-library/4.4;C:/Program Files/R/R-4.4.2/library"

-- Make 'yank' and 'paste' use the system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Line numbers
vim.opt.number = true           -- Enable line numbers
vim.opt.relativenumber = true   -- Enable relative line numbers
vim.opt.numberwidth = 2         -- Allows enough space for two numbers to be displayed on the number column
vim.opt.signcolumn = 'yes'      -- Space at the left of the number column for line informations

-- Line settings
vim.opt.wrap = false            -- Displays everything on a single line
vim.opt.scrolloff = 10          -- Always keeps 10 lines of context when scrolling
vim.opt.sidescrolloff = 8       -- Same thing but sideways
vim.opt.sidescroll = 1          -- Scroll sideways by 1 column at a time

-- Indentation
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.tabstop = 4             -- Number of spaces for a tab
vim.opt.shiftwidth = 4          -- Number of spaces for indentation
vim.opt.softtabstop = 4         -- Number of spaces when pressing <Tab>

-- Disable traditional smartindent and autoindent
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Highlighting current line
vim.opt.cursorline = true

-- Terminal options
vim.o.shell = "powershell"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""

-- Disabling netrw 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable backup file creation
vim.opt.backup = false

-- Disable syntax concealment
vim.opt.conceallevel = 0

-- Set file encoding to UTF-8
vim.opt.fileencoding = 'utf-8'

-- Enable mouse support
vim.opt.mouse = 'a'

-- Hide mode display
vim.opt.showmode = false

-- Force horizontal and vertical splits below and to the right of the current window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable term GUI colors
vim.opt.termguicolors = true

-- Set timeout for mapped sequences
vim.opt.timeoutlen = 1000

-- Undoing
vim.opt.undofile = true

-- Updatetime after completion
vim.opt.updatetime = 100

-- Prevent editing of files being edited elsewhere
vim.opt.writebackup = false

-- Searching Behaviors
vim.opt.hlsearch = true         -- Highlight all matches in search
vim.opt.ignorecase = true       -- Ignore case in search
vim.opt.smartcase = true        -- Match case if explicitly stated
