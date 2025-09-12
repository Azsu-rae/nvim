
-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

function SetKeymap(mode, key, map, opts)
    if type(opts) == "table" then
        vim.keymap.set(mode, key, map, opts)
    elseif type(opts) == "string" then
        vim.keymap.set(mode, key, map, {desc=opts, silent=false})
    end
end

-- In insert mode, make <BS> delete all indent on an "empty" line
vim.keymap.set("i", "<BS>", function()
  local col = vim.fn.col(".")
  local line = string.sub(vim.fn.getline("."), 1, col - 1)

  if line:match("^%s*$") and col > 1 then
    return "<C-u>"  -- delete everything before the cursor on this line
  else
    return "<BS>"   -- normal backspace
  end
end, { expr = true, noremap = true })

------------------------------ GENERAL SETTINGS ------------------------------

SetKeymap("n", "<Esc>", "<cmd>nohlsearch<CR>", "Remove search highlights")

SetKeymap("n", "<leader>t", "<cmd>term<CR>", "Enter terminal mode")
SetKeymap("t", "<Esc><Esc>", "<C-\\><C-n><cmd>bd!<CR>", "Exit terminal mode")
SetKeymap("t", "<leader><Esc>", "<C-\\><C-n>", "Enter normal mode in terminal mode")

SetKeymap({'t', 'i'}, '<A-h>', '<C-\\><C-n><C-w>h', "Move focus to the left window")
SetKeymap({'t', 'i'}, '<A-j>', '<C-\\><C-n><C-w>j', "Move focus to the right window")
SetKeymap({'t', 'i'}, '<A-k>', '<C-\\><C-n><C-w>k', "Move focus to the lower window")
SetKeymap({'t', 'i'}, '<A-l>', '<C-\\><C-n><C-w>l', "Move focus to the upper window")

SetKeymap('n', '<A-h>', '<C-w>h', "Move focus to the left window")
SetKeymap('n', '<A-j>', '<C-w>j', "Move focus to the right window")
SetKeymap('n', '<A-k>', '<C-w>k', "Move focus to the lower window")
SetKeymap('n', '<A-l>', '<C-w>l', "Move focus to the upper window")

SetKeymap("n", "<leader>wv", "<cmd>vsplit<cr>", "[W]indow Split [V]ertical")
SetKeymap("n", "<leader>wh", "<cmd>split<cr>", "[W]indow Split [H]orizontal")

-- gv is for reselecting the last visual selection
SetKeymap("v", "<", "<gv", "Indent left in visual mode")
SetKeymap("v", ">", ">gv", "Indent right in visual mode")

SetKeymap("n", "<leader>i", "<cmd>Inspect<CR>", "[I]nspect What's Under the Cursor")

SetKeymap("n", "<leader>wrp", function () vim.opt.wrap = not vim.opt.wrap:get() end, "Toggle line [W]rapping")

local function diagfloat()
    return vim.diagnostic.open_float()
end
SetKeymap("n", "<leader>odf", function() diagfloat() end, "[O]pen [D]iagnostic [F]loat")

local function focus_diagnostic_float()
    local _, float_win = diagfloat()
    if float_win then
        vim.api.nvim_set_current_win(float_win) -- force focus
    end
end
SetKeymap("n", "<leader>fdf", focus_diagnostic_float, "[F]ocus [D]iagnostic [F]loat")

SetKeymap("n", "<leader>s", function() require('packer').sync() end, "[S]ync Packer")

if Bootstrap then
    return
end

------------------------------ NVIM TREE ------------------------------

SetKeymap("n", "<leader>e", require('nvim-tree.api').tree.toggle, "Toggle NvimTree")

------------------------------ TELESCOPE ------------------------------

local telescope_builtin = require("telescope.builtin")

SetKeymap("n", "<leader>ff", telescope_builtin.find_files, "[F]ind [F]iles")
SetKeymap("n", "<leader>fg", telescope_builtin.live_grep, "[F]ind by [G]rep")
SetKeymap("n", "<leader>fd", telescope_builtin.diagnostics, "[F]ind [D]iagnostics")
SetKeymap("n", "<leader>fr", telescope_builtin.resume, "[F]inder [R]esume")
SetKeymap("n", "<leader>f.", telescope_builtin.oldfiles, '[F]ind Recent Files ("." for repeat)')
SetKeymap("n", "<leader>fb", telescope_builtin.buffers, "[F]ind Existing [B]uffers")

local edit_config_file = function()
    vim.cmd.cd(vim.fn.stdpath("config"))
    telescope_builtin.find_files()
end
SetKeymap("n", "<leader>cf", edit_config_file, "Edit Neovim [C]onfig [F]iles")

------------------------------ LSP ------------------------------

SetKeymap("n", "<leader>cr", telescope_builtin.lsp_references, "[C]ode Goto [R]eferences")
SetKeymap("n", "<leader>ci", telescope_builtin.lsp_implementations,"[C]ode Goto [I]mplementations")
SetKeymap("n", "<leader>ch", vim.lsp.buf.hover, "[C]ode [H]over Documentation")
SetKeymap("n", "<leader>cd", vim.lsp.buf.definition, "[C]ode Goto [D]efinition")
SetKeymap("n", "<leader>cD", vim.lsp.buf.declaration, "[C]ode Goto [D]eclaration")
SetKeymap("n", "<leader>cR", vim.lsp.buf.rename, "[C]ode [R]ename")
SetKeymap({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")

------------------------------ DAP ------------------------------

local dap = require("dap")

-- Keymaps
SetKeymap("n", "<leader>dc", dap.continue, "DAP Continue")
SetKeymap("n", "<leader>dov", dap.step_over, "DAP Step Over")
SetKeymap("n", "<leader>dou", dap.step_out, "DAP Step Out")
SetKeymap("n", "<leader>dsi", dap.step_into, "DAP Step Into")
SetKeymap("n", "<leader>db", dap.toggle_breakpoint, "DAP Toggle Breakpoint")

local function setbp()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end
SetKeymap("n", "<leader>dB", setbp, "DAP Conditional Breakpoint")

local function log()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end
SetKeymap("n", "<leader>dl", log, "DAP Log Point")

SetKeymap("n", "<leader>dr", dap.repl.open, "DAP REPL")
SetKeymap("n", "<leader>dl", dap.run_last, "DAP Run Last")
SetKeymap("n", "<leader>dq", dap.terminate, "DAP Terminate")
