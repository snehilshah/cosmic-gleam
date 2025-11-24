-- Cosmic Gleam theme loader for Neovim
-- Main entry point for loading and applying themes

local M = {}

-- Available themes
local themes = {
  noctis = "cosmic-gleam.themes.noctis",
  catbox = "cosmic-gleam.themes.catbox",
  ["zen-hc"] = "cosmic-gleam.themes.zen-hc",
}

-- Apply a highlight group
local function apply_highlights(groups)
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

-- Load and apply a theme
function M.load(theme_name)
  -- Default to noctis if no theme specified
  theme_name = theme_name or "noctis"
  
  -- Check if theme exists
  if not themes[theme_name] then
    vim.notify(
      string.format("Cosmic Gleam: Theme '%s' not found. Using 'noctis'.", theme_name),
      vim.log.levels.WARN
    )
    theme_name = "noctis"
  end
  
  -- Reset syntax highlighting
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set background
  vim.o.background = "dark"
  
  -- Set theme name
  vim.g.colors_name = "cosmic-gleam-" .. theme_name
  
  -- Load theme module
  local ok, theme = pcall(require, themes[theme_name])
  if not ok then
    vim.notify(
      string.format("Cosmic Gleam: Error loading theme '%s': %s", theme_name, theme),
      vim.log.levels.ERROR
    )
    return
  end
  
  -- Get colors and highlight groups
  local colors = theme.colors
  local groups = theme.groups(colors)
  
  -- Apply highlights
  apply_highlights(groups)
  
  -- Set terminal colors if available
  if vim.g.cosmic_gleam_terminal_colors ~= false then
    M.set_terminal_colors(colors)
  end
end

-- Set terminal colors
function M.set_terminal_colors(colors)
  -- Define terminal colors based on the theme
  -- These are defaults that work well with most themes
  if colors.bg then
    vim.g.terminal_color_0 = colors.bg_dark or colors.bg
    vim.g.terminal_color_8 = colors.fg_gutter or colors.comment
  end
  
  if colors.red then
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red
  end
  
  if colors.green then
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green
  end
  
  if colors.yellow then
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow
  end
  
  if colors.blue then
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue
  end
  
  if colors.purple or colors.mauve then
    local purple = colors.purple or colors.mauve
    vim.g.terminal_color_5 = purple
    vim.g.terminal_color_13 = purple
  end
  
  if colors.cyan or colors.sky or colors.teal then
    local cyan = colors.cyan or colors.sky or colors.teal
    vim.g.terminal_color_6 = cyan
    vim.g.terminal_color_14 = cyan
  end
  
  if colors.fg then
    vim.g.terminal_color_7 = colors.fg_dark or colors.fg
    vim.g.terminal_color_15 = colors.fg
  end
end

-- Setup function for user configuration
function M.setup(opts)
  opts = opts or {}
  
  -- Allow users to disable terminal colors
  if opts.terminal_colors ~= nil then
    vim.g.cosmic_gleam_terminal_colors = opts.terminal_colors
  end
  
  -- Load theme if specified
  if opts.theme then
    M.load(opts.theme)
  end
end

-- List available themes
function M.list_themes()
  local theme_list = {}
  for name, _ in pairs(themes) do
    table.insert(theme_list, name)
  end
  table.sort(theme_list)
  return theme_list
end

return M
