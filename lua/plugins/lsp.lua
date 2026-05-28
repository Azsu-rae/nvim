-- lua-language-server (keywords: lua) "lua_ls",
-- bash-language-server (keywords: bash, csh, ksh, sh, zsh) "bashls",
-- clangd (keywords: c, c++) "clangd",
-- texlab (keywords: latex) "texlab",
-- json-lsp (keywords: json) "jsonls",
-- css-lsp (keywords: css, scss, less) "cssls",
-- html-lsp (keywords: html) "html",
--
return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      vim.lsp.enable({
        "lua_ls", -- lua-language-server
        "bashls", -- bash-language-server
        "clangd", -- clangd
        "texlab", -- texlab
        "jsonls", -- json-lsp
        "cssls",  -- css-lsp
        "html",   -- html-lsp
      })
      vim.diagnostic.config {
        virtual_text = true
      }
    end,
  },
}
