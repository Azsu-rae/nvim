
local servers = {"clangd", "lua_ls", "pyright", "texlab", "r_language_server", "lemminx"}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities
    })
end
