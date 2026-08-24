
local langs = {
  {
    name = "python",
    lsp = "basedpyright",
  },
  {
    name = "lua",
    lsp = "lua_ls",
    mason_name = "lua-language-server",
    twospace_indent = true,
  },
  {
    name = "bash",
    lsp = "bashls",
    mason_name = "bash-language-server",
    ft = "sh",
  },
  {
    name = "html",
    mason_name = "html-lsp",
    twospace_indent = true,
    sublangs = {
      {
        name = "htmldjango",
        lsp = "djls",
        mason_name = "",
        twospace_indent = true,
      },
    },
  },
  {
    name = "css",
    lsp = "cssls",
    mason_name = "css-lsp",
    twospace_indent = true,
  },
  {
    name = "javascript",
    mason_name = "typescript-language-server",
    lsp = "ts_ls",
    twospace_indent = true,
    sublangs = {
      {
        name = "javascript-xml",
        ft = "javascriptreact",
        treesitter = "",
        lsp = "",
      },
    },
  },
  {
    name = "json",
    mason_name = "json-lsp",
    lsp = "jsonls",
    twospace_indent = true,
  },
  {
    name = "typescript",
    mason_name = "typescript-language-server",
    lsp = "ts_ls",
    twospace_indent = true,
    sublangs = {
      name = "typescript-xml",
      treesitter = "tsx",
      ft = "",
      lsp = ""
    },
  },
  {
    name = "c",
    lsp = "clangd",
  },
  {
    name = "rust",
    lsp = "rust_analyzer",
    mason_name = "rust-analyzer",
  },
  {
    name = "java",
    lsp = "",  -- handled by the jdtls plugin
    mason_name = "jdtls",  -- handled by the jdtls plugin
  },
  {
    name = "latex",
    ft = "tex",
    lsp = "texlab",
  },
  {
    name = "typst",
    ft = "typ",
    lsp = "tinymist",
  },
}

local M = {}

M.filetypes = {}
M.treesitters = {}
M.LSPs = {}
M.twospace_indent = {}

local function process(languages)
  for _, lang in ipairs(languages) do

    lang.ft = lang.ft or lang.name
    if lang.ft ~= "" then
      table.insert(M.filetypes, lang.ft)
    end

    lang.lsp = lang.lsp or lang.name
    if lang.lsp ~= "" then
      table.insert(M.LSPs, lang.lsp)
    end

    lang.treesitter = lang.treesitter or lang.name
    if lang.treesitter ~= "" then
      table.insert(M.treesitters, lang.treesitter)
    end

    if lang.twospace_indent then
      table.insert(M.twospace_indent, lang.ft)
    end

    -- TODO: add the mason_name default value-ing

    if lang.sublangs then
      process(lang.sublangs)
    end
  end
end

process(langs)
return M
