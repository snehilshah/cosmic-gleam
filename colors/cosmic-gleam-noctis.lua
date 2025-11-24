-- Cosmic Gleam: Noctis
-- Colorscheme loader for Neovim

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "cosmic-gleam-noctis"

require("cosmic-gleam").load("noctis")
