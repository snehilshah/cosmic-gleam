-- Cosmic Gleam: Catbox theme for Neovim
-- Based on the VS Code theme with Gruvbox inspiration

local M = {}

-- Color palette
M.colors = {
  -- Background colors
  bg = "#1d2021",
  bg_dark = "#191b1c",
  bg_highlight = "#404040",
  bg_visual = "#4d4d4d",
  
  -- Foreground colors
  fg = "#ebdbb2",
  fg_dark = "#d5c4a1",
  fg_gutter = "#928374",
  
  -- Special colors
  none = "NONE",
  
  -- Semantic colors (Gruvbox-inspired)
  green = "#a9b665",
  green_bright = "#89b482",
  aqua = "#89b482",
  teal = "#7daea3",
  blue = "#7daea3",
  purple = "#d3869b",
  yellow = "#d8a657",
  orange = "#e78a4e",
  red = "#ea6962",
  
  -- UI specific
  comment = "#928374",
  dark_comment = "#928374",
  line_nr = "#89B4822F",
  line_nr_active = "#89b482",
  cursor = "#89b482",
  error = "#ea6962",
  warning = "#d8a657",
  info = "#89b482",
  hint = "#a9b665",
}

-- Highlight groups
M.groups = function(colors)
  local c = colors
  
  return {
    -- Editor
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg },
    FloatBorder = { fg = c.green_bright, bg = c.bg },
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
    IncSearch = { bg = c.orange, fg = c.bg, bold = true },
    CurSearch = { link = "IncSearch" },
    MatchParen = { fg = c.teal, bg = c.bg_dark, bold = true },
    
    -- Window
    VertSplit = { fg = c.bg_dark },
    WinSeparator = { fg = c.bg_dark, bold = true },
    WinBar = { fg = c.fg_dark, bg = c.bg },
    WinBarNC = { fg = c.fg_dark, bg = c.bg },
    
    -- Folds
    Folded = { fg = c.blue, bg = c.bg_dark },
    FoldColumn = { fg = c.comment, bg = c.bg },
    
    -- Diff
    DiffAdd = { bg = c.green, fg = c.bg },
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
    Number = { fg = c.purple },
    Boolean = { fg = c.purple },
    Float = { fg = c.purple },
    
    Identifier = { fg = c.fg },
    Function = { fg = c.blue },
    
    Statement = { fg = c.red, bold = true },
    Conditional = { fg = c.red, bold = true },
    Repeat = { fg = c.red, bold = true },
    Label = { fg = c.red },
    Operator = { fg = c.orange },
    Keyword = { fg = c.red, bold = true },
    Exception = { fg = c.red },
    
    PreProc = { fg = c.aqua },
    Include = { fg = c.aqua },
    Define = { fg = c.aqua },
    Macro = { fg = c.aqua },
    PreCondit = { fg = c.aqua },
    
    Type = { fg = c.yellow },
    StorageClass = { fg = c.orange, italic = true },
    Structure = { fg = c.aqua },
    Typedef = { fg = c.yellow },
    
    Special = { fg = c.orange },
    SpecialChar = { fg = c.orange },
    Tag = { fg = c.aqua },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.comment, italic = true },
    Debug = { fg = c.red },
    
    Underlined = { underline = true },
    Ignore = { fg = c.comment },
    Error = { fg = c.error },
    Todo = { fg = c.yellow, bg = c.bg, bold = true },
    
    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.purple, italic = true },
    ["@variable.parameter"] = { fg = c.orange },
    ["@variable.member"] = { fg = c.fg },
    
    ["@constant"] = { fg = c.yellow },
    ["@constant.builtin"] = { fg = c.purple },
    ["@constant.macro"] = { fg = c.yellow },
    
    ["@module"] = { fg = c.aqua },
    ["@label"] = { fg = c.red },
    
    ["@string"] = { fg = c.green },
    ["@string.regexp"] = { fg = c.green },
    ["@string.escape"] = { fg = c.orange },
    ["@string.special"] = { fg = c.green },
    
    ["@character"] = { fg = c.green },
    ["@character.special"] = { fg = c.orange },
    
    ["@number"] = { fg = c.purple },
    ["@boolean"] = { fg = c.purple },
    ["@float"] = { fg = c.purple },
    
    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.blue },
    ["@function.method"] = { fg = c.blue },
    
    ["@constructor"] = { fg = c.aqua },
    ["@operator"] = { fg = c.orange, bold = true },
    
    ["@keyword"] = { fg = c.red, bold = true },
    ["@keyword.function"] = { fg = c.red, bold = true },
    ["@keyword.operator"] = { fg = c.orange, bold = true },
    ["@keyword.return"] = { fg = c.red, bold = true },
    ["@keyword.import"] = { fg = c.aqua, italic = true },
    
    ["@conditional"] = { fg = c.red, bold = true },
    ["@repeat"] = { fg = c.red, bold = true },
    ["@exception"] = { fg = c.red },
    
    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.yellow, italic = true },
    ["@type.definition"] = { fg = c.yellow },
    ["@type.qualifier"] = { fg = c.red, italic = true },
    
    ["@attribute"] = { fg = c.aqua },
    ["@property"] = { fg = c.fg },
    ["@field"] = { fg = c.fg },
    
    ["@comment"] = { fg = c.comment, italic = true },
    ["@comment.documentation"] = { fg = c.dark_comment, italic = true },
    
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.orange },
    
    ["@tag"] = { fg = c.aqua },
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.fg },
    
    ["@markup.heading"] = { fg = c.green, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = c.blue, underline = true },
    ["@markup.link.url"] = { fg = c.blue },
    ["@markup.raw"] = { fg = c.aqua },
    ["@markup.list"] = { fg = c.red },
    ["@markup.quote"] = { fg = c.fg_dark, italic = true },
    
    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = c.yellow },
    ["@lsp.type.decorator"] = { fg = c.orange },
    ["@lsp.type.enum"] = { fg = c.yellow },
    ["@lsp.type.enumMember"] = { fg = c.purple },
    ["@lsp.type.function"] = { fg = c.blue },
    ["@lsp.type.interface"] = { fg = c.yellow },
    ["@lsp.type.macro"] = { fg = c.aqua },
    ["@lsp.type.method"] = { fg = c.blue },
    ["@lsp.type.namespace"] = { fg = c.aqua },
    ["@lsp.type.parameter"] = { fg = c.orange },
    ["@lsp.type.property"] = { fg = c.fg },
    ["@lsp.type.struct"] = { fg = c.yellow },
    ["@lsp.type.type"] = { fg = c.yellow },
    ["@lsp.type.typeParameter"] = { fg = c.yellow },
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
    TelescopeBorder = { fg = c.green_bright, bg = c.bg },
    TelescopePromptBorder = { fg = c.green_bright, bg = c.bg },
    TelescopeResultsBorder = { fg = c.green_bright, bg = c.bg },
    TelescopePreviewBorder = { fg = c.green_bright, bg = c.bg },
    TelescopeSelection = { fg = c.green_bright, bg = c.bg_highlight },
    TelescopeSelectionCaret = { fg = c.green_bright },
    TelescopeMatching = { fg = c.yellow, bold = true },
    
    -- NvimTree
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeFolderIcon = { fg = c.blue },
    NvimTreeEmptyFolderName = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.blue, bold = true },
    NvimTreeRootFolder = { fg = c.red, bold = true },
    NvimTreeSpecialFile = { fg = c.orange },
    NvimTreeGitDirty = { fg = c.yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    
    -- Which-key
    WhichKey = { fg = c.red },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.bg_highlight },
    IndentBlanklineContextChar = { fg = c.green_bright },
    
    -- Indent Blankline v3 (new names)
    IblIndent = { fg = c.bg_highlight },
    IblScope = { fg = c.green_bright },
  }
end

return M
