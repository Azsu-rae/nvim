
------------------------------ GENERAL SETTINGS ------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Enter Vim's terminal mode
vim.keymap.set("n", "<leader>t", ":term<CR>", { desc = "Enter terminal mode" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>bd!<CR>", { desc = "Exit terminal mode" })

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




