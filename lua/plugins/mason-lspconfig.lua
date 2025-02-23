
-- ensure that we have lua language server, java language server, and java test language server are installed
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "jdtls"},
})
