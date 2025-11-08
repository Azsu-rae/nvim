
-- [[ Setting options ]] See `:h vim.o` and `:h vim.opt`
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Make 'yank' and 'paste' use the system clipboard
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)

vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Line numbers
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.numberwidth = 2 -- Allows enough space for two numbers to be displayed on the number column (it's a minimum not a maximum)
vim.opt.signcolumn = "yes" -- Space at the left of the number column for line informations

-- Line settings
vim.opt.wrap = false -- Displays everything on a single line
vim.opt.breakindent = true -- keeps wraped text indentation when breaking a line

vim.opt.scrolloff = 10 -- Always keeps 10 lines of context when scrolling
vim.opt.sidescrolloff = 8 -- Same thing but sideways
vim.opt.sidescroll = 1 -- Scroll sideways by 1 column at a time

-- Highlighting current line
vim.opt.cursorline = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Disable traditional smartindent and autoindent
vim.opt.smartindent = false
vim.opt.autoindent = false

-- Force horizontal and vertical splits below and to the right of the current window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set file encoding to UTF-8
vim.opt.fileencoding = "utf-8"

-- Searching Behaviors
vim.opt.hlsearch = true -- Highlight all matches in search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Match case if explicitly state

-- Enable mouse support
vim.opt.mouse = "a"

-- Enable term GUI colors (24-bit colors, otherwise limited to 256 colors)
vim.opt.termguicolors = true

-- Disable syntax concealment
vim.opt.conceallevel = 0

-- Hide mode display (INSERT, VISUAL....)
vim.opt.showmode = false

-- Set timeout for mapped sequences
vim.opt.timeoutlen = 1000

-- save undoing even after you quit
vim.opt.undofile = true

-- Updatetime after completion (events update)
vim.opt.updatetime = 100

-- Disable backup file creation (after :w)
vim.opt.backup = false

-- Disable backup file creation (before :w)
vim.opt.writebackup = false

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- See `:help 'confirm'`
vim.opt.confirm = true

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.wildmenu = false
vim.opt.wildmode = "longest:full,full"
