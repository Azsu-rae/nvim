return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      -- 1. Register your custom configs from your lsp/ folder
      vim.lsp.enable({
        "pylsp", "lua_ls", "bashls", "html", "cssls", "jsonls", "ts_ls", "clangd", "rust_analyzer", "tinymist",
      })
      vim.diagnostic.config {
        virtual_text = true
      }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  }
}
