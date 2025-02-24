
local lspconfig = require("lspconfig")

local servers = { "clangd", "lua_ls", "r_language_server", "pyright" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end
