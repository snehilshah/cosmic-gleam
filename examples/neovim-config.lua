-- Example configuration for testing Cosmic Gleam themes in Neovim
-- This file demonstrates how to use the themes

-- Method 1: Using vim.cmd
vim.cmd.colorscheme("cosmic-gleam-noctis")

-- Method 2: Using require and setup
require("cosmic-gleam").setup({
  theme = "noctis", -- or "catbox" or "zen-hc"
  terminal_colors = true,
})

-- Method 3: Direct load
require("cosmic-gleam").load("noctis")

-- List available themes
local themes = require("cosmic-gleam").list_themes()
print("Available themes:", vim.inspect(themes))

-- Example: Create a command to switch themes
vim.api.nvim_create_user_command("CosmicGleam", function(opts)
  local theme = opts.args
  require("cosmic-gleam").load(theme)
end, {
  nargs = 1,
  complete = function()
    return require("cosmic-gleam").list_themes()
  end,
  desc = "Switch Cosmic Gleam theme"
})

-- Usage: :CosmicGleam noctis | :CosmicGleam catbox | :CosmicGleam zen-hc
