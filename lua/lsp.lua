local ok, lsp_cmp = pcall(require, 'cmp_nvim_lsp')

local capabilities = nil
if ok then
  capabilities = lsp_cmp.default_capabilities()
end

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.enable(require("langs").lsp)

vim.diagnostic.config {
  virtual_text = true
}
