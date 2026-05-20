return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local langs = { "lua", "python", "javascript", "typescript", "c", "cpp", "java", "html", "css", "bash", "json",
      "scala", "typst", "latex" }
    if require("osconfig").in_win then table.insert(langs, "powershell") end
    require("nvim-treesitter").install(langs)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "lua", "python", "javascript", "typescript", "c", "cpp", "java", "html", "css", "sh", "json",
        "scala", "typ", "tex" },
      callback = function() vim.treesitter.start() end,
    })
  end
}
