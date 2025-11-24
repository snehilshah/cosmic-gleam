-- Cosmic Gleam: Noctis theme for Neovim
-- Based on the VS Code theme with Catppuccin Mocha inspiration

local M = {}

-- Color palette
M.colors = {
  -- Background colors
  bg = "#1b1e28",
  bg_dark = "#11111b",
  bg_highlight = "#313244",
  bg_visual = "#585b70",
  
  -- Foreground colors
  fg = "#cdd6f4",
  fg_dark = "#a6adc8",
  fg_gutter = "#585b70",
  
  -- Special colors
  none = "NONE",
  
  -- Semantic colors
  rosewater = "#F2D5CF",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  
  -- UI specific
  comment = "#6C7086",
  dark_comment = "#585b70",
  line_nr = "#F2D5CF2f",
  line_nr_active = "#F2D5CF",
  cursor = "#F2D5CF",
  error = "#f38ba8",
  warning = "#f9e2af",
  info = "#89dceb",
  hint = "#a6e3a1",
}

-- Highlight groups
M.groups = function(colors)
  local c = colors
  
  return {
    -- Editor
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg },
    FloatBorder = { fg = c.rosewater, bg = c.bg },
    ColorColumn = { bg = c.bg_dark },
    Cursor = { fg = c.bg, bg = c.cursor },
    lCursor = { fg = c.bg, bg = c.cursor },
    CursorIM = { fg = c.bg, bg = c.cursor },
    CursorLine = { bg = c.bg_dark },
    CursorLineNr = { fg = c.line_nr_active, bold = true },
    LineNr = { fg = c.line_nr },
    SignColumn = { fg = c.fg_gutter, bg = c.bg },
    StatusLine = { fg = c.fg_gutter, bg = c.bg },
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg },
    Visual = { bg = c.bg_visual },
    VisualNOS = { bg = c.bg_visual },
    Search = { bg = c.yellow, fg = c.bg, bold = true },
    IncSearch = { bg = c.peach, fg = c.bg, bold = true },
    CurSearch = { link = "IncSearch" },
    MatchParen = { fg = c.sky, bg = c.bg_dark, bold = true },
    
    -- Window
    VertSplit = { fg = c.bg_dark },
    WinSeparator = { fg = c.bg_dark, bold = true },
    WinBar = { fg = c.fg_dark, bg = c.bg },
    WinBarNC = { fg = c.fg_dark, bg = c.bg },
    
    -- Folds
    Folded = { fg = c.blue, bg = c.bg_dark },
    FoldColumn = { fg = c.comment, bg = c.bg },
    
    -- Diff
    DiffAdd = { bg = c.teal, fg = c.bg },
    DiffChange = { bg = c.blue, fg = c.bg },
    DiffDelete = { bg = c.red, fg = c.bg },
    DiffText = { bg = c.blue, fg = c.fg, bold = true },
    
    -- Pmenu
    Pmenu = { fg = c.fg, bg = c.bg },
    PmenuSel = { bg = c.bg_highlight, bold = true },
    PmenuSbar = { bg = c.bg_highlight },
    PmenuThumb = { bg = c.fg_gutter },
    
    -- Tabs
    TabLine = { fg = c.fg_dark, bg = c.bg },
    TabLineFill = { bg = c.bg },
    TabLineSel = { fg = c.fg, bg = c.bg },
    
    -- Messages
    ErrorMsg = { fg = c.error },
    WarningMsg = { fg = c.warning },
    ModeMsg = { fg = c.fg_dark, bold = true },
    MoreMsg = { fg = c.blue },
    Question = { fg = c.blue },
    
    -- Syntax
    Comment = { fg = c.comment, italic = true },
    
    Constant = { fg = c.yellow },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.maroon },
    Boolean = { fg = c.maroon },
    Float = { fg = c.maroon },
    
    Identifier = { fg = c.fg },
    Function = { fg = c.blue },
    
    Statement = { fg = c.mauve, bold = true },
    Conditional = { fg = c.mauve, bold = true },
    Repeat = { fg = c.mauve, bold = true },
    Label = { fg = c.mauve },
    Operator = { fg = c.mauve },
    Keyword = { fg = c.mauve, bold = true },
    Exception = { fg = c.red },
    
    PreProc = { fg = c.mauve },
    Include = { fg = c.mauve },
    Define = { fg = c.mauve },
    Macro = { fg = c.mauve },
    PreCondit = { fg = c.mauve },
    
    Type = { fg = c.rosewater },
    StorageClass = { fg = c.red, italic = true },
    Structure = { fg = c.rosewater },
    Typedef = { fg = c.rosewater },
    
    Special = { fg = c.flamingo },
    SpecialChar = { fg = c.flamingo },
    Tag = { fg = c.red },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.comment, italic = true },
    Debug = { fg = c.peach },
    
    Underlined = { underline = true },
    Ignore = { fg = c.comment },
    Error = { fg = c.error },
    Todo = { fg = c.yellow, bg = c.bg, bold = true },
    
    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.maroon, italic = true },
    ["@variable.parameter"] = { fg = c.peach },
    ["@variable.member"] = { fg = c.fg },
    
    ["@constant"] = { fg = c.yellow },
    ["@constant.builtin"] = { fg = c.maroon },
    ["@constant.macro"] = { fg = c.yellow },
    
    ["@module"] = { fg = c.sky },
    ["@label"] = { fg = c.mauve },
    
    ["@string"] = { fg = c.green },
    ["@string.regexp"] = { fg = c.green },
    ["@string.escape"] = { fg = c.flamingo },
    ["@string.special"] = { fg = c.green },
    
    ["@character"] = { fg = c.green },
    ["@character.special"] = { fg = c.flamingo },
    
    ["@number"] = { fg = c.maroon },
    ["@boolean"] = { fg = c.maroon },
    ["@float"] = { fg = c.maroon },
    
    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.blue },
    ["@function.method"] = { fg = c.blue },
    
    ["@constructor"] = { fg = c.sky },
    ["@operator"] = { fg = c.mauve, bold = true },
    
    ["@keyword"] = { fg = c.mauve, bold = true },
    ["@keyword.function"] = { fg = c.red, bold = true },
    ["@keyword.operator"] = { fg = c.mauve, bold = true },
    ["@keyword.return"] = { fg = c.mauve, bold = true },
    ["@keyword.import"] = { fg = c.mauve, italic = true },
    
    ["@conditional"] = { fg = c.mauve, bold = true },
    ["@repeat"] = { fg = c.mauve, bold = true },
    ["@exception"] = { fg = c.red },
    
    ["@type"] = { fg = c.rosewater },
    ["@type.builtin"] = { fg = c.rosewater, italic = true },
    ["@type.definition"] = { fg = c.rosewater },
    ["@type.qualifier"] = { fg = c.mauve, italic = true },
    
    ["@attribute"] = { fg = c.yellow },
    ["@property"] = { fg = c.fg },
    ["@field"] = { fg = c.fg },
    
    ["@comment"] = { fg = c.comment, italic = true },
    ["@comment.documentation"] = { fg = c.dark_comment, italic = true },
    
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.flamingo },
    
    ["@tag"] = { fg = c.red },
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.mauve },
    
    ["@markup.heading"] = { fg = c.red, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = c.blue, underline = true },
    ["@markup.link.url"] = { fg = c.sky },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.list"] = { fg = c.mauve },
    ["@markup.quote"] = { fg = c.fg_dark, italic = true },
    
    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = c.rosewater },
    ["@lsp.type.decorator"] = { fg = c.teal },
    ["@lsp.type.enum"] = { fg = c.rosewater },
    ["@lsp.type.enumMember"] = { fg = c.yellow },
    ["@lsp.type.function"] = { fg = c.blue },
    ["@lsp.type.interface"] = { fg = c.rosewater },
    ["@lsp.type.macro"] = { fg = c.mauve },
    ["@lsp.type.method"] = { fg = c.blue },
    ["@lsp.type.namespace"] = { fg = c.sky },
    ["@lsp.type.parameter"] = { fg = c.peach },
    ["@lsp.type.property"] = { fg = c.fg },
    ["@lsp.type.struct"] = { fg = c.rosewater },
    ["@lsp.type.type"] = { fg = c.rosewater },
    ["@lsp.type.typeParameter"] = { fg = c.rosewater },
    ["@lsp.type.variable"] = { fg = c.fg },
    
    -- Diagnostics
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },
    
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
    
    DiagnosticVirtualTextError = { fg = c.error, bg = c.bg },
    DiagnosticVirtualTextWarn = { fg = c.warning, bg = c.bg },
    DiagnosticVirtualTextInfo = { fg = c.info, bg = c.bg },
    DiagnosticVirtualTextHint = { fg = c.hint, bg = c.bg },
    
    DiagnosticSignError = { fg = c.error },
    DiagnosticSignWarn = { fg = c.warning },
    DiagnosticSignInfo = { fg = c.info },
    DiagnosticSignHint = { fg = c.hint },
    
    -- LSP
    LspReferenceText = { bg = c.bg_visual },
    LspReferenceRead = { bg = c.bg_visual },
    LspReferenceWrite = { bg = c.bg_visual },
    
    -- Git Signs
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.blue },
    GitSignsDelete = { fg = c.red },
    
    -- Telescope
    TelescopeBorder = { fg = c.rosewater, bg = c.bg },
    TelescopePromptBorder = { fg = c.rosewater, bg = c.bg },
    TelescopeResultsBorder = { fg = c.rosewater, bg = c.bg },
    TelescopePreviewBorder = { fg = c.rosewater, bg = c.bg },
    TelescopeSelection = { fg = c.rosewater, bg = c.bg_highlight },
    TelescopeSelectionCaret = { fg = c.rosewater },
    TelescopeMatching = { fg = c.yellow, bold = true },
    
    -- NvimTree
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeEmptyFolderName = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
    NvimTreeRootFolder = { fg = c.mauve, bold = true },
    NvimTreeSpecialFile = { fg = c.yellow },
    NvimTreeGitDirty = { fg = c.yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    
    -- Which-key
    WhichKey = { fg = c.mauve },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.bg_highlight },
    IndentBlanklineContextChar = { fg = c.rosewater },
  }
end

return M
