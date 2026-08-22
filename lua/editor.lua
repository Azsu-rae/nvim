if vim.g.neovide then
  vim.o.guifont = "jetBrainsMono Nerd Font"
  -- vim.o.guifont = "Vazir Code"
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_message_area_drag_selection = true
  vim.g.neovide_refresh_rate = 0

  vim.g.neovide_progress_bar_enabled = false
  -- vim.g.neovide_progress_bar_height = 5.0
  -- vim.g.neovide_progress_bar_animation_speed = 200.0
  -- vim.g.neovide_progress_bar_hide_delay = 0.2

  -- vim.g.neovide_position_animation_length = 0
  -- vim.g.neovide_cursor_animation_length = 0.00
  -- vim.g.neovide_cursor_trail_size = 0
  -- vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_cursor_animate_command_line = false
  -- vim.g.neovide_scroll_animation_far_lines = 0
  -- vim.g.neovide_scroll_animation_length = 0.00

  local function paste() vim.api.nvim_paste(vim.fn.getreg("+"), true, -1) end
  vim.keymap.set({ "i","t" }, "<C-v>", paste, { silent = true, desc = "Paste" })
end
