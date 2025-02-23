
------------------------------ GENERAL SETTINGS ------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Enter Vim's terminal mode
vim.keymap.set("n", "<leader>t", ":term<CR>", { desc = "Enter terminal mode" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>bd!<CR>", { desc = "Exit terminal mode" })

-- Enter nomal mode in terminal
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

------------------------------ NVIM TREE ------------------------------

-- Set keymaps for opening and closing nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

------------------------------ TELESCOPE ------------------------------

local telescope_builtin = require('telescope.builtin')

-- set a vim motion to <Space> + f + f to search for files by their names
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {desc = "[F]ind [F]iles"})
-- set a vim motion to <Space> + f + g to search for files based on the text inside of them
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {desc = "[F]ind by [G]rep"})
-- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
-- set a vim motion to <Space> + f + r to resume the previous search
vim.keymap.set('n', '<leader>fr', telescope_builtin.resume, { desc = '[F]inder [R]esume' })
-- set a vim motion to <Space> + f + . to search for Recent Files
vim.keymap.set('n', '<leader>f.', telescope_builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
-- set a vim motion to <Space> + f + b to search Open Buffers
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = '[F]ind Existing [B]uffers' })

------------------------------ LSP ------------------------------

-- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
-- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
-- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
-- Set vim motion for <Space> + c + r to display references to the code under the cursor
vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
-- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
-- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
-- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

------------------------------ DAP ------------------------------

-- gain access to the dap plugin and its functions
local dap = require("dap")

-- gain access to the dap ui plugin and its functions
local dapui = require("dapui")

-- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
-- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
-- set a vim motion to close the debugging ui
vim.keymap.set("n", "<leader>dc", dapui.close, {desc = "[D]ebug [C]lose"})
