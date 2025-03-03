
local lspconfig = require("lspconfig")

lspconfig.r_language_server.setup({
  cmd = { "C:\\Program Files\\R\\R-4.4.2\\bin\\Rscript.exe", "-e", "languageserver::run()" },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local servers = { "clangd", "lua_ls", "pyright", "texlab"}


for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end
