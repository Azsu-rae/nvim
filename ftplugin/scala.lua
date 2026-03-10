-- vim.api.nvim_set_hl(0, "@lsp.mod.readonly.scala", {})
-- vim.api.nvim_set_hl(0, "@lsp.type.keyword.scala", {})
-- vim.api.nvim_set_hl(0, "@lsp.type.class.scala", {})
-- vim.api.nvim_set_hl(0, "@lsp.type.namespace.scala", {})

vim.keymap.set("n", "<leader>c", function()
  vim.cmd(string.format("split | term scala", vim.fn.expand('%:p')))
end)

vim.keymap.set("n", "<leader>nc", function()
  vim.cmd(string.format("tabnew | term sbt", vim.fn.expand('%:p')))
end)

-- Disable semantic tokens only for Scala
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- Only target Scala buffers
    if vim.bo[bufnr].filetype == "scala" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
