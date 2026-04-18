vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "html",
    "css",
    "lua",
    "dart",
  },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Replace 'clangd' with the name of the server you want to disable
    if client and client.name == "dartls" then
      --      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
