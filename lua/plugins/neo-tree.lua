return {

--        
--        
--          🌀   ✱   ⭒   ✦   * 
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- icons
--    "antosha417/nvim-lsp-file-operations", -- optional LSP file ops
  },
  config = function()

    vim.keymap.set("n", "<leader>e", "<CMD>Neotree filesystem reveal toggle<CR>")

    -- Change file name color
    vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#a8e3a1", bg = "NONE" })
    -- Change icon color
    vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#89b4fa", bg = "NONE" })
    -- Change modified indicator
    vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = "#f7768e", bg = "NONE", bold = true })
    -- Change indent marker color
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#6e6c7c", bg = "NONE" })
    -- Sidebar background
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    -- added (green)
    vim.api.nvim_set_hl(0, "NeoTreeGitModified",    { fg = "#7A88CF", bg = "NONE" })
    -- modified (muted yellow/orange)
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = "#1628f2", bg = "NONE" })
    -- deleted (red)
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked",  { fg = "#F7768E", bg = "NONE" })
    -- conflict (bright warning)
    vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = "#F7768E", bg = "NONE", bold=true })
    require("neo-tree").setup({
      default_component_configs = {
        name = { use_git_status_colors = false },
        git_status = {
          symbols = {
            -- Change *type* (what happened to the file)
            added     = "➕", -- file added
            modified  = "✱", -- file modified
            deleted   = "🗑️", -- file deleted
            renamed   = "➡️", -- file renamed

            -- *Status* (state in git)
            untracked = "?",  -- untracked
            ignored   = "○",  -- ignored
            unstaged  = "",  -- unstaged changes
            staged    = "✔️", -- staged
            conflict  = "",  -- merge conflict
          },
        },
      },
    })
  end,
}
