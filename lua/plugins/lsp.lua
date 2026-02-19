return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      -- 1. Register your custom configs from your lsp/ folder
      vim.lsp.enable({
        "pylsp", "lua_ls", "bashls", "html", "cssls", "jsonls", "ts_ls", "clangd", "rust_analyzer"
      })
      vim.diagnostic.config {
        virtual_text = true
      }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}
