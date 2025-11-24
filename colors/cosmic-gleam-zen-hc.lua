-- Cosmic Gleam: Zen High Contrast
-- Colorscheme loader for Neovim

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam-zen-hc"

require("cosmic-gleam").load("zen-hc")
