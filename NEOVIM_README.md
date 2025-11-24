# Cosmic Gleam for Neovim

A sophisticated collection of Neovim themes with a cosmic aesthetic, inspired by Catppuccin Mocha and Gruvbox. This is the Neovim port of the popular Cosmic Gleam VS Code theme.

## Features

- 🌙 **Three beautiful themes**: Noctis, Catbox, and Zen High Contrast
- 🎨 **Full syntax highlighting**: Comprehensive support for Treesitter and LSP
- 🔧 **Plugin support**: Works great with popular Neovim plugins like Telescope, NvimTree, and more
- 🌈 **Terminal colors**: Consistent colors in integrated terminal
- ⚡ **Modern Neovim**: Built for Neovim 0.8+ with Lua

## Themes

### Noctis 🦉
A sophisticated blend of Catppuccin Mocha inspiration with a subtle cosmic aesthetic. Perfect for late-night coding sessions with its soothing purple and blue accents.

### Catbox 📻
Inspired by Gruvbox, this theme offers warm, earthy tones with excellent readability. Great for those who prefer a more traditional feel with modern touches.

### Zen High Contrast 🌚
A high-contrast theme designed for maximum readability and accessibility. Perfect for bright environments or for users who prefer stronger visual contrast.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "snehilshah/cosmic-gleam",
  lazy = false,
  priority = 1000,
  config = function()
    require("cosmic-gleam").setup({
      -- Optional configuration
      theme = "noctis", -- or "catbox" or "zen-hc"
      terminal_colors = true, -- Apply theme colors to terminal
    })
    -- Apply the colorscheme
    vim.cmd.colorscheme("cosmic-gleam-noctis")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "snehilshah/cosmic-gleam",
  config = function()
    require("cosmic-gleam").setup({
      theme = "noctis",
      terminal_colors = true,
    })
    vim.cmd.colorscheme("cosmic-gleam-noctis")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'snehilshah/cosmic-gleam'
```

Then in your `init.lua`:
```lua
require("cosmic-gleam").setup({
  theme = "noctis",
  terminal_colors = true,
})
vim.cmd.colorscheme("cosmic-gleam-noctis")
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/snehilshah/cosmic-gleam.git ~/.local/share/nvim/site/pack/themes/start/cosmic-gleam
```

2. Add to your `init.lua`:
```lua
require("cosmic-gleam").setup()
vim.cmd.colorscheme("cosmic-gleam-noctis")
```

## Usage

### Switching Themes

You can switch between themes using the `:colorscheme` command:

```vim
:colorscheme cosmic-gleam-noctis
:colorscheme cosmic-gleam-catbox
:colorscheme cosmic-gleam-zen-hc
```

Or programmatically in Lua:

```lua
vim.cmd.colorscheme("cosmic-gleam-noctis")
-- or
require("cosmic-gleam").load("noctis")
```

### Configuration

The `setup()` function accepts the following options:

```lua
require("cosmic-gleam").setup({
  -- Default theme to load (optional)
  theme = "noctis", -- "noctis" | "catbox" | "zen-hc"
  
  -- Apply theme colors to terminal (default: true)
  terminal_colors = true,
})
```

### Plugin Integration

Cosmic Gleam includes built-in support for popular Neovim plugins:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Enhanced syntax highlighting
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP integration
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding helper
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent guides
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled (automatically set by the theme)
- A terminal that supports true color

## Color Palette

### Noctis Theme
Based on Catppuccin Mocha with cosmic touches:
- Background: `#1b1e28`
- Foreground: `#cdd6f4`
- Accent: `#F2D5CF` (Rosewater)
- Keywords: `#cba6f7` (Mauve)
- Strings: `#a6e3a1` (Green)
- Functions: `#89b4fa` (Blue)

### Catbox Theme
Inspired by Gruvbox:
- Background: `#1d2021`
- Foreground: `#ebdbb2`
- Accent: `#89b482` (Aqua)
- Keywords: `#ea6962` (Red)
- Strings: `#a9b665` (Green)
- Functions: `#7daea3` (Blue)

### Zen High Contrast Theme
Maximum contrast for accessibility:
- Background: `#000000` (Pure black)
- Foreground: `#ffffff` (Pure white)
- Accent: `#6fc3df` (Cyan)
- Keywords: `#c586c0` (Purple)
- Strings: `#7fd962` (Green)
- Functions: `#dcdcaa` (Yellow)

## Customization

You can override specific highlight groups after loading the theme:

```lua
vim.cmd.colorscheme("cosmic-gleam-noctis")

-- Override specific highlights
vim.api.nvim_set_hl(0, "Comment", { fg = "#7f849c", italic = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#89b4fa", bold = true })
```

## Troubleshooting

### Colors don't look right

Make sure your terminal supports true colors and that `termguicolors` is enabled:

```lua
vim.opt.termguicolors = true
```

### Theme not loading

Ensure Neovim version is 0.8.0 or higher:
```vim
:version
```

### Plugin highlights not working

Some plugins may need to be loaded after the colorscheme. Make sure the colorscheme is set with high priority in your plugin manager.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Credits

- Inspired by [Catppuccin](https://github.com/catppuccin/nvim) and [Gruvbox](https://github.com/morhetz/gruvbox)
- Original VS Code theme by [Snehil Ronak Shah](https://github.com/snehilshah)

## License

MIT License - see [LICENSE](LICENSE) file for details

## Related Projects

- [Cosmic Gleam for VS Code](https://marketplace.visualstudio.com/items?itemName=srshah.cosmic-gleam) - The original VS Code theme

---

Made with 💜 by [Snehil Ronak Shah](https://github.com/snehilshah)
