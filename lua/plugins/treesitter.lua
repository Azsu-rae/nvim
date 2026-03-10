return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local langs = { "lua", "python", "javascript", "typescript", "c", "cpp", "java", "html", "css", "bash", "json",
      "scala", "typst", "sh" }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = langs,
      callback = function() vim.treesitter.start() end,
    })
    require("nvim-treesitter").install(langs)
  end
}
