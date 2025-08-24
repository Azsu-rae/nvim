
require("lazydev").setup {
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            {
                path = "${3rd}/luv/library", words = { "vim%.uv" }
            },
        },
    },
}

vim.diagnostic.config {
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
        prefix = "● ",     -- customize symbol
        spacing = 2,       -- spaces before text
    },
}

-- setup mason with default properties
require("mason").setup()

-- cmp_nvim_lsp is already listed as a source for nvim-cmp (check cmp.lua)
-- this will tell the LSP what to send to cmp_nvim_lsp so that it does just that
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
local lspconfig_util = require('lspconfig.util')

local root_markers = {
    lua_ls={'.luarc.json', '.luarc.jsonc', '.git'},
    jdtls={'.git'},
    clangd={'.git'},
    pyright={'.git'},
    texlab={'.git'},
    lemminx={'.git'},
}

local setup_server = function(server_name)

    if server_name ~= "jdtls" then
        lspconfig[server_name].setup {
            capabilities = capabilities,
            root_dir = lspconfig_util.root_pattern(table.unpack(root_markers[server_name])),
        }
    end
end

require("mason-lspconfig").setup {
     ensure_installed = {"lua_ls", "jdtls", "clangd", "pyright", "texlab", "lemminx", "bashls"},
     handlers = {setup_server},
     automatic_enable = {
         exclude = {
             "jdtls",
         },
     },
}
