-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[silent! %s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end
})

-- start treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = require("langs").ft,
  callback = function()
    vim.treesitter.start()
    local ok, actions = pcall(require, "otter")
    if ok then
      actions.activate()
    end
  end,
})

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
