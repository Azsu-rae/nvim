
local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config("*", {
    capabilities = capabilities,
})

local setup_server = function(server_name)
    vim.lsp.enable(server_name)
end

local mason_lspconfig = {
     ensure_installed = {"lua_ls", "clangd", "jdtls", "pyright"},
     handlers = {setup_server},
     automatic_enable = {
         exclude = {
             "jdtls",
         },
     },
}

local diagnostic_config = {
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        prefix = "● ",     -- customize symbol
        spacing = 2,       -- spaces before text
    },
}

M.setup = function()
   require("mason").setup() -- setup mason with default properties
   require("mason-lspconfig").setup(mason_lspconfig)
   vim.diagnostic.config(diagnostic_config)
end

return M
