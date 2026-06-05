local M = {}

M.lsp = {
  "lua_ls", "bashls", "pylsp", "clangd", "rust_analyzer", "texlab", "jsonls", "cssls", "html", "ts_ls",
  "djls", "tinymist"
}

M.ts = {
  "lua", "python", "javascript", "typescript", "c", "cpp", "java",
  "html", "css", "bash", "json", "scala", "typst", "latex", "htmldjango", "rust"
}
if require("osconfig").in_win then table.insert(M.ts, "powershell") end

M.ft = {
  "lua", "python", "javascript", "typescript", "c", "cpp", "java",
  "html", "css", "sh", "json", "scala", "typst", "tex", "htmldjango", "rust"
}

return M
