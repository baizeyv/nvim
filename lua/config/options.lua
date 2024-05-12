-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.linespace = 1
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
if not vim.g.vscode then
  vim.opt.timeoutlen = 500
end

vim.o.guifont = "RecMonoLinear Nerd Font Mono:h11"
if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_vfx_mode = "wireframe"
end
