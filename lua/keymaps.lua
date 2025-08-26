
function SetKeymap(mode, key, map, opts)
    if type(opts) == "table" then
        vim.keymap.set(mode, key, map, opts)
    elseif type(opts) == "string" then
        vim.keymap.set(mode, key, map, {desc=opts, silent=false})
    end
end

------------------------------ GENERAL SETTINGS ------------------------------

SetKeymap("n", "<Esc>", "<cmd>nohlsearch<CR>", "Remove search highlights")

SetKeymap("n", "<leader>t", ":term<CR>", "Enter terminal mode")
SetKeymap("t", "<Esc><Esc>", "<C-\\><C-n><cmd>bd!<CR>", "Exit terminal mode")
SetKeymap("t", "<leader><Esc>", "<C-\\><C-n>", "Enter normal mode in terminal mode")

SetKeymap("n", "<C-h>", "<C-w><C-h>", "Move focus to the left window")
SetKeymap("n", "<C-l>", "<C-w><C-l>", "Move focus to the right window")
SetKeymap("n", "<C-j>", "<C-w><C-j>", "Move focus to the lower window")
SetKeymap("n", "<C-k>", "<C-w><C-k>", "Move focus to the upper window")

SetKeymap("n", "<leader>wv", ":vsplit<cr>", "[W]indow Split [V]ertical")
SetKeymap("n", "<leader>wh", ":split<cr>", "[W]indow Split [H]orizontal")

-- gv is for reselecting the last visual selection
SetKeymap("v", "<", "<gv", "Indent left in visual mode")
SetKeymap("v", ">", ">gv", "Indent right in visual mode")

SetKeymap("n", "<leader>i", ":Inspect<CR>", "[I]nspect What's Under the Cursor")

local toggle_wrapping = function()
    vim.opt.wrap = not vim.opt.wrap:get()
end
SetKeymap("n", "<leader>w", toggle_wrapping, "Toggle line [W]rapping")

local open_diagnostic_float = function()
    vim.diagnostic.open_float(nil, {focus=true, max_width=80})
end
SetKeymap("n", "<leader>odf", open_diagnostic_float, "[O]pen [D]iagnostic [F]loat")

local edit_config_file = function()
    vim.cmd.edit("$MYVIMRC")
    vim.cmd.cd(Vimscript.stdpath("config"))
end
SetKeymap("n", "<leader>cf", edit_config_file, "Edit Neovim [C]onfig [F]ile")

if Cashe.bootstrap then
    return
end

------------------------------ NVIM TREE ------------------------------

SetKeymap("n", "<leader>e", ":NvimTreeToggle<CR>", "")

------------------------------ TELESCOPE ------------------------------

local telescope_builtin = require("telescope.builtin")

SetKeymap("n", "<leader>ff", telescope_builtin.find_files, "[F]ind [F]iles")
SetKeymap("n", "<leader>fg", telescope_builtin.live_grep, "[F]ind by [G]rep")
SetKeymap("n", "<leader>fd", telescope_builtin.diagnostics, "[F]ind [D]iagnostics")
SetKeymap("n", "<leader>fr", telescope_builtin.resume, "[F]inder [R]esume")
SetKeymap("n", "<leader>f.", telescope_builtin.oldfiles, '[F]ind Recent Files ("." for repeat)')
SetKeymap("n", "<leader>fb", telescope_builtin.buffers, "[F]ind Existing [B]uffers")

------------------------------ LSP ------------------------------

SetKeymap("n", "<leader>ch", vim.lsp.buf.hover, "[C]ode [H]over Documentation")
SetKeymap("n", "<leader>cd", vim.lsp.buf.definition, "[C]ode Goto [D]efinition")
SetKeymap({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
SetKeymap("n", "<leader>cr", telescope_builtin.lsp_references, "[C]ode Goto [R]eferences")
SetKeymap("n", "<leader>ci", telescope_builtin.lsp_implementations,"[C]ode Goto [I]mplementations")
SetKeymap("n", "<leader>cR", vim.lsp.buf.rename, "[C]ode [R]ename")
SetKeymap("n", "<leader>cD", vim.lsp.buf.declaration, "[C]ode Goto [D]eclaration")

------------------------------ DAP ------------------------------

local dap = require('dap')

SetKeymap("n", "<leader>db", dap.toggle_breakpoint, "Toggle [B]reakpoint")
SetKeymap("n", "<leader>dc", dap.continue, "[C]ontinue/Start Debug")
SetKeymap("n", "<leader>di", dap.step_into, "Step [I]nto")
SetKeymap("n", "<leader>do", dap.step_over, "Step [O]ver")
SetKeymap("n", "<leader>du", dap.step_out, "Step Out")
SetKeymap("n", "<leader>dr", dap.repl.open, "Open [R]EPL")
SetKeymap("n", "<leader>dq", dap.terminate, "Update Debug Configs")
SetKeymap("n", "<leader>dt", "<cmd>JdtUpdateDebugConfigs<CR>", "Update Debug Configs")
