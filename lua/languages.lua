
local langs = {
  {
    name = "python",
    lsp = "basedpyright",
  },
  {
    name = "lua",
    lsp = "lua_ls",
    twospace_indent = true,
  },
  {
    name = "bash",
    lsp = "bashls",
    ft = "sh",
  },
  {
    name = "html",
    twospace_indent = true,
    sublangs = {
      {
        name = "django-template",
        ft = "htmldjango",
        lsp = "djls",
        twospace_indent = true,
      },
    },
  },
  {
    name = "css",
    lsp = "cssls",
    twospace_indent = true,
  },
  {
    name = "javascript",
    lsp = "ts_ls",
    twospace_indent = true,
    sublangs = {
      {
        name = "JavaScript-XML",
        ft = "javascriptreact",
        treesitter = "",
        lsp = "",
      },
    },
  },
  {
    name = "json",
    lsp = "jsonls",
    twospace_indent = true,
  },
  {
    name = "typescript",
    lsp = "ts_ls",
    twospace_indent = true,
    sublangs = {
      name = "TypeScript-XML",
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
  },
  {
    name = "java",
    lsp = "",  -- handled by the jdtls plugin
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

    if lang.sublangs then
      process(lang.sublangs)
    end
  end
end

process(langs)
return M
