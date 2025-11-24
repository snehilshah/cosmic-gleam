-- Cosmic Gleam: Zen High Contrast theme for Neovim
-- Based on the VS Code high contrast theme

local M = {}

-- Color palette
M.colors = {
  -- Background colors
  bg = "#000000",
  bg_dark = "#000000",
  bg_highlight = "#1a1a1a",
  bg_visual = "#2d2d2d",
  
  -- Foreground colors
  fg = "#ffffff",
  fg_dark = "#d4d4d4",
  fg_gutter = "#6a737d",
  
  -- Special colors
  none = "NONE",
  
  -- Semantic colors (High contrast)
  red = "#f48771",
  green = "#7fd962",
  yellow = "#dcdcaa",
  blue = "#569cd6",
  purple = "#c586c0",
  cyan = "#4ec9b0",
  orange = "#ce9178",
  pink = "#d16d9e",
  
  -- UI specific
  comment = "#6a9955",
  dark_comment = "#608b4e",
  line_nr = "#858585",
  line_nr_active = "#ffffff",
  cursor = "#ffffff",
  error = "#f48771",
  warning = "#dcdcaa",
  info = "#569cd6",
  hint = "#4ec9b0",
  
  -- Additional contrast colors
  border = "#6fc3df",
}

-- Highlight groups
M.groups = function(colors)
  local c = colors
  
  return {
    -- Editor
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg },
    FloatBorder = { fg = c.border, bg = c.bg },
    ColorColumn = { bg = c.bg_dark },
    Cursor = { fg = c.bg, bg = c.cursor },
    lCursor = { fg = c.bg, bg = c.cursor },
    CursorIM = { fg = c.bg, bg = c.cursor },
    CursorLine = { bg = c.bg_highlight },
    CursorLineNr = { fg = c.line_nr_active, bold = true },
    LineNr = { fg = c.line_nr },
    SignColumn = { fg = c.fg_gutter, bg = c.bg },
    StatusLine = { fg = c.fg, bg = c.bg_highlight },
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_highlight },
    Visual = { bg = c.bg_visual },
    VisualNOS = { bg = c.bg_visual },
    Search = { bg = c.yellow, fg = c.bg, bold = true },
    IncSearch = { bg = c.orange, fg = c.bg, bold = true },
    CurSearch = { link = "IncSearch" },
    MatchParen = { fg = c.cyan, bg = c.bg_highlight, bold = true },
    
    -- Window
    VertSplit = { fg = c.border },
    WinSeparator = { fg = c.border, bold = true },
    WinBar = { fg = c.fg_dark, bg = c.bg },
    WinBarNC = { fg = c.fg_dark, bg = c.bg },
    
    -- Folds
    Folded = { fg = c.blue, bg = c.bg_highlight },
    FoldColumn = { fg = c.comment, bg = c.bg },
    
    -- Diff
    DiffAdd = { bg = c.green, fg = c.bg },
    DiffChange = { bg = c.blue, fg = c.bg },
    DiffDelete = { bg = c.red, fg = c.bg },
    DiffText = { bg = c.blue, fg = c.fg, bold = true },
    
    -- Pmenu
    Pmenu = { fg = c.fg, bg = c.bg_highlight },
    PmenuSel = { bg = c.bg_visual, bold = true },
    PmenuSbar = { bg = c.bg_highlight },
    PmenuThumb = { bg = c.fg_gutter },
    
    -- Tabs
    TabLine = { fg = c.fg_dark, bg = c.bg },
    TabLineFill = { bg = c.bg },
    TabLineSel = { fg = c.fg, bg = c.bg, bold = true },
    
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
    Number = { fg = c.cyan },
    Boolean = { fg = c.blue },
    Float = { fg = c.cyan },
    
    Identifier = { fg = c.fg },
    Function = { fg = c.yellow },
    
    Statement = { fg = c.purple, bold = true },
    Conditional = { fg = c.purple, bold = true },
    Repeat = { fg = c.purple, bold = true },
    Label = { fg = c.purple },
    Operator = { fg = c.fg },
    Keyword = { fg = c.purple, bold = true },
    Exception = { fg = c.purple },
    
    PreProc = { fg = c.purple },
    Include = { fg = c.purple },
    Define = { fg = c.purple },
    Macro = { fg = c.purple },
    PreCondit = { fg = c.purple },
    
    Type = { fg = c.cyan },
    StorageClass = { fg = c.blue, italic = true },
    Structure = { fg = c.cyan },
    Typedef = { fg = c.cyan },
    
    Special = { fg = c.orange },
    SpecialChar = { fg = c.orange },
    Tag = { fg = c.blue },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.comment, italic = true },
    Debug = { fg = c.red },
    
    Underlined = { underline = true },
    Ignore = { fg = c.comment },
    Error = { fg = c.error },
    Todo = { fg = c.yellow, bg = c.bg, bold = true },
    
    -- Treesitter
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.blue, italic = true },
    ["@variable.parameter"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.fg },
    
    ["@constant"] = { fg = c.yellow },
    ["@constant.builtin"] = { fg = c.blue },
    ["@constant.macro"] = { fg = c.yellow },
    
    ["@module"] = { fg = c.cyan },
    ["@label"] = { fg = c.purple },
    
    ["@string"] = { fg = c.green },
    ["@string.regexp"] = { fg = c.orange },
    ["@string.escape"] = { fg = c.orange },
    ["@string.special"] = { fg = c.green },
    
    ["@character"] = { fg = c.green },
    ["@character.special"] = { fg = c.orange },
    
    ["@number"] = { fg = c.cyan },
    ["@boolean"] = { fg = c.blue },
    ["@float"] = { fg = c.cyan },
    
    ["@function"] = { fg = c.yellow },
    ["@function.builtin"] = { fg = c.yellow },
    ["@function.macro"] = { fg = c.yellow },
    ["@function.method"] = { fg = c.yellow },
    
    ["@constructor"] = { fg = c.cyan },
    ["@operator"] = { fg = c.fg, bold = true },
    
    ["@keyword"] = { fg = c.purple, bold = true },
    ["@keyword.function"] = { fg = c.purple, bold = true },
    ["@keyword.operator"] = { fg = c.purple, bold = true },
    ["@keyword.return"] = { fg = c.purple, bold = true },
    ["@keyword.import"] = { fg = c.purple, italic = true },
    
    ["@conditional"] = { fg = c.purple, bold = true },
    ["@repeat"] = { fg = c.purple, bold = true },
    ["@exception"] = { fg = c.purple },
    
    ["@type"] = { fg = c.cyan },
    ["@type.builtin"] = { fg = c.cyan, italic = true },
    ["@type.definition"] = { fg = c.cyan },
    ["@type.qualifier"] = { fg = c.blue, italic = true },
    
    ["@attribute"] = { fg = c.yellow },
    ["@property"] = { fg = c.fg },
    ["@field"] = { fg = c.fg },
    
    ["@comment"] = { fg = c.comment, italic = true },
    ["@comment.documentation"] = { fg = c.dark_comment, italic = true },
    
    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.orange },
    
    ["@tag"] = { fg = c.blue },
    ["@tag.attribute"] = { fg = c.cyan },
    ["@tag.delimiter"] = { fg = c.fg },
    
    ["@markup.heading"] = { fg = c.blue, bold = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = c.blue, underline = true },
    ["@markup.link.url"] = { fg = c.cyan },
    ["@markup.raw"] = { fg = c.cyan },
    ["@markup.list"] = { fg = c.purple },
    ["@markup.quote"] = { fg = c.fg_dark, italic = true },
    
    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = c.cyan },
    ["@lsp.type.decorator"] = { fg = c.yellow },
    ["@lsp.type.enum"] = { fg = c.cyan },
    ["@lsp.type.enumMember"] = { fg = c.yellow },
    ["@lsp.type.function"] = { fg = c.yellow },
    ["@lsp.type.interface"] = { fg = c.cyan },
    ["@lsp.type.macro"] = { fg = c.purple },
    ["@lsp.type.method"] = { fg = c.yellow },
    ["@lsp.type.namespace"] = { fg = c.cyan },
    ["@lsp.type.parameter"] = { fg = c.fg },
    ["@lsp.type.property"] = { fg = c.fg },
    ["@lsp.type.struct"] = { fg = c.cyan },
    ["@lsp.type.type"] = { fg = c.cyan },
    ["@lsp.type.typeParameter"] = { fg = c.cyan },
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
    TelescopeBorder = { fg = c.border, bg = c.bg },
    TelescopePromptBorder = { fg = c.border, bg = c.bg },
    TelescopeResultsBorder = { fg = c.border, bg = c.bg },
    TelescopePreviewBorder = { fg = c.border, bg = c.bg },
    TelescopeSelection = { fg = c.fg, bg = c.bg_visual },
    TelescopeSelectionCaret = { fg = c.border },
    TelescopeMatching = { fg = c.yellow, bold = true },
    
    -- NvimTree
    NvimTreeFolderName = { fg = c.cyan },
    NvimTreeFolderIcon = { fg = c.cyan },
    NvimTreeEmptyFolderName = { fg = c.cyan },
    NvimTreeOpenedFolderName = { fg = c.cyan, bold = true },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeSpecialFile = { fg = c.yellow },
    NvimTreeGitDirty = { fg = c.yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    
    -- Which-key
    WhichKey = { fg = c.purple },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.comment },
    
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.bg_highlight },
    IndentBlanklineContextChar = { fg = c.border },
  }
end

return M
