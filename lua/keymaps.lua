
-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- In insert mode, make <BS> delete all indent on an "empty" line
vim.keymap.set("i", "<BS>", function()

    local col = vim.fn.col(".")
    local line = string.sub(vim.fn.getline("."), 1, col - 1)

    if line:match("^%s*$") and col > 1 then
        return "<C-u>"  -- delete everything before the cursor on this line
    else
        return "<BS>"   -- normal backspace
    end
end, {
    expr = true,
    noremap=true
})

vim.keymap.set("n", "<leader>git", function ()

    local root = require('utils.dir').root()
    if not root then
        vim.notify('No .git found!')
        return
    end

    local commit = vim.fn.input("Commit message: ")
    if commit == "" then
       vim.notify('Commit aborted!')
       return
    end

    local gitcmd = "git add . | git commit -m \"%s\" | git push origin main"
    vim.cmd(":split | term " .. string.format(gitcmd, commit))

end)

------------------------------ GENERAL SETTINGS ------------------------------

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>src", "<cmd>:source $MYVIMRC<cr>")

vim.keymap.set("n", "<leader>t", "<cmd>split | term<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>tab split<CR>")
vim.keymap.set("n", "<leader>ts", function ()
    local win_id = vim.api.nvim_get_current_win()
    vim.cmd('tab split')
    vim.api.nvim_win_close(win_id, true)
end)

vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>")

vim.keymap.set({'t', 'i'}, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({'t', 'i'}, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({'t', 'i'}, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({'t', 'i'}, '<A-l>', '<C-\\><C-n><C-w>l')

vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>wh", "<cmd>split<cr>")

-- gv is for reselecting the last visual selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>i", "<cmd>Inspect<CR>")
vim.keymap.set("n", "<leader>wrp", function () vim.opt.wrap = not vim.opt.wrap:get() end)
vim.keymap.set("n", "<leader>syn", function() require('packer').sync() end)

local function diagfloat() return vim.diagnostic.open_float() end
vim.keymap.set("n", "<leader>odf", diagfloat)

vim.keymap.set("n", "<leader>fdf", function ()
    local _, float_win = diagfloat()
    if float_win then vim.api.nvim_set_current_win(float_win) end
end)

if Bootstrap then
    return
end

------------------------------ NVIM TREE ------------------------------

vim.keymap.set("n", "<leader>e", require('nvim-tree.api').tree.toggle)

------------------------------ TELESCOPE ------------------------------

local telescope_builtin = require("telescope.builtin")
local themes = require('telescope.themes')

vim.keymap.set("n", "<leader>ff", function() telescope_builtin.find_files(themes.get_ivy()) end)
vim.keymap.set("n", "<leader>fg", function() telescope_builtin.live_grep(themes.get_ivy()) end)
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics)
vim.keymap.set("n", "<leader>fr", telescope_builtin.resume)
vim.keymap.set("n", "<leader>f.", telescope_builtin.oldfiles)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)

------------------------------ LSP ------------------------------

vim.keymap.set("n", "<leader>cr", telescope_builtin.lsp_references)
vim.keymap.set("n", "<leader>ci", telescope_builtin.lsp_implementations)
vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename)
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action)

------------------------------ DAP ------------------------------

local dap = require("dap")

-- Keymaps
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dov", dap.step_over)
vim.keymap.set("n", "<leader>dou", dap.step_out)
vim.keymap.set("n", "<leader>dsi", dap.step_into)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)

vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
vim.keymap.set("n", "<leader>dl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)

vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leader>dl", dap.run_last)
vim.keymap.set("n", "<leader>dq", dap.terminate)
