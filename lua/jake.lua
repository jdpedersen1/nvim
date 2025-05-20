-- jake.lua - A Neovim colorscheme
-- Converted from Vim colorscheme

-- Terminal color to hex mappings
local term_colors = {
  [0] = "#000000",   -- Black
  [1] = "#800000",   -- Red
  [2] = "#c23d36",   -- Green
  [3] = "#808000",   -- Yellow
  [4] = "#000080",   -- Blue
  [5] = "#800080",   -- Magenta
  [6] = "#008080",   -- Cyan
  [7] = "#c0c0c0",   -- White
  [8] = "#808080",   -- Bright Black (Gray)
  [9] = "#ff0000",   -- Bright Red
  [10] = "#00ff00",  -- Bright Green
  [11] = "#ffff00",  -- Bright Yellow
  [12] = "#0000ff",  -- Bright Blue
  [13] = "#ff00ff",  -- Bright Magenta
  [14] = "#008080",  -- Bright Cyan
  [15] = "#ffffff",  -- Bright White
  -- Standard 256-color terminal palette
  [66] = "#417070",  -- Teal
  [95] = "#553f31",  -- Dusty Rose
  [102] = "#878787", -- Medium Gray
  [138] = "#af8787", -- Rosy Brown
  [232] = "#080808", -- Very Dark Gray
  [235] = "#262626", -- Dark Gray
  [236] = "#303030", -- Medium Dark Gray
  [239] = "#4e4e4e", -- Gray
  [243] = "#767676", -- Medium Light Gray
  [251] = "#c6c6c6", -- Light Gray
}

local M = {}

function M.setup()
  -- Clear existing highlighting and set the colors name
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "jake"
  
  -- Set background
  vim.opt.background = "dark"
  
  -- Define highlight groups
  local highlights = {
    -- Base syntax highlighting
    Normal = { ctermfg = 66, fg = term_colors[66] },
    Constant = { ctermfg = 66, fg = term_colors[66] },
    Boolean = { link = "Constant" },
    Character = { link = "Constant" },
    Number = { link = "Constant" },
    Float = { link = "Constant" },
    String = { link = "Constant" },
    
    Statement = { ctermfg = 243, fg = term_colors[243] },
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Keyword = { link = "Statement" },
    Exception = { link = "Statement" },
    PreProc = { link = "Statement" },
    Include = { link = "PreProc" },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },
    
    Comment = { ctermfg = 102, fg = term_colors[102], italic = true },
    
    Type = { ctermfg = 251, fg = term_colors[251] },
    StorageClass = { link = "Type" },
    Structure = { link = "Type" },
    Typedef = { link = "Type" },
    Identifier = { link = "Type" },
    Function = { link = "Type" },
    
    Operator = { ctermfg = 251, fg = term_colors[251], bold = true },
    
    Special = { ctermfg = 66, fg = term_colors[66], italic = true },
    SpecialChar = { link = "Special" },
    Tag = { link = "Special" },
    Delimiter = { link = "Special" },
    SpecialComment = { link = "Special" },
    Debug = { link = "Special" },
    
    -- UI elements
    Error = { ctermfg = 1, fg = term_colors[1], ctermbg = 0, bg = term_colors[0] },
    ErrorMsg = { ctermfg = 1, fg = term_colors[1], ctermbg = 0, bg = term_colors[0] },
    MatchParen = { ctermfg = 1, fg = term_colors[1], ctermbg = 0, bg = term_colors[0] },
    
    Cursor = { ctermbg = 0, bg = term_colors[0] },
    CursorLine = { ctermbg = 236, bg = term_colors[236], bold = true },
    CursorLineNr = { ctermfg = 66, fg = term_colors[66], ctermbg = 236, bg = term_colors[236], bold = true },
    ColorColumn = { ctermbg = 232, bg = term_colors[232] },
    CursorColumn = { ctermbg = 0, bg = term_colors[0] },
    
    SpecialKey = { ctermfg = 10, fg = term_colors[10] },
    
    SpellBad = { ctermfg = 95, fg = term_colors[95], underline = true },
    SpellCap = { ctermfg = 66, fg = term_colors[66], underline = true },
    SpellLocal = { ctermfg = 2, fg = term_colors[2], underline = true },
    SpellRare = { ctermfg = 9, fg = term_colors[9], underline = true },
    
    Search = { ctermfg = 66, fg = term_colors[66], ctermbg = 235, bg = term_colors[235] },
    IncSearch = { ctermfg = 235, fg = term_colors[235], ctermbg = 6, bg = term_colors[6] },
    
    Directory = { ctermfg = 66, fg = term_colors[66] },
    Title = { ctermfg = 66, fg = term_colors[66] },
    
    Pmenu = { ctermfg = 251, fg = term_colors[251], ctermbg = 239, bg = term_colors[239] },
    PmenuSbar = { ctermfg = 251, fg = term_colors[251], ctermbg = 239, bg = term_colors[239] },
    PmenuSel = { ctermfg = 251, fg = term_colors[251], ctermbg = 66, bg = term_colors[66] },
    PmenuThumb = { ctermfg = 251, fg = term_colors[251], ctermbg = 239, bg = term_colors[239] },
    
    DiffAdd = { ctermfg = 10, fg = term_colors[10] },
    DiffChange = { ctermfg = 3, fg = term_colors[3] },
    DiffDelete = { ctermfg = 1, fg = term_colors[1] },
    DiffText = { ctermfg = 66, fg = term_colors[66] },
    
    StatusLine = { ctermbg = 236, bg = term_colors[236] },
    StatusLineNC = { ctermfg = 243, fg = term_colors[243], ctermbg = 236, bg = term_colors[236] },
    
    Visual = { ctermfg = 1, fg = term_colors[1], ctermbg = 232, bg = term_colors[232] },
    VisualNOS = { ctermbg = 239, bg = term_colors[239] },
    
    FoldColumn = { ctermfg = 239, fg = term_colors[239] },
    Folded = { ctermfg = 243, fg = term_colors[243] },
    
    TabLine = { ctermfg = 251, fg = term_colors[251], ctermbg = 236, bg = term_colors[236] },
    TabLineSel = { ctermfg = 66, fg = term_colors[66], ctermbg = 239, bg = term_colors[239], bold = true },
    TabLineFill = { ctermfg = 66, fg = term_colors[66], ctermbg = 236, bg = term_colors[236] },
    
    WarningMsg = { ctermfg = 138, fg = term_colors[138] },
    LineNr = { ctermfg = 243, fg = term_colors[243] },
    ModeMsg = { ctermfg = 243, fg = term_colors[243], bold = true },
    MoreMsg = { ctermfg = 243, fg = term_colors[243], bold = true },
    NonText = { ctermfg = 243, fg = term_colors[243] },
    Question = { ctermfg = 1, fg = term_colors[1] },
    Todo = { ctermfg = 66, fg = term_colors[66] },
    VertSplit = { ctermfg = 236, fg = term_colors[236], ctermbg = 236, bg = term_colors[236] },
    WildMenu = { ctermfg = 232, fg = term_colors[232], ctermbg = 251, bg = term_colors[251] },
    
    -- Git and diff highlighting
    diffCommon = { link = "Statement" },
    diffRemoved = { link = "DiffDelete" },
    diffChanged = { link = "DiffChange" },
    diffAdded = { link = "DiffAdd" },
    
    -- Git signs
    SignColumn = { ctermbg = "NONE", bg = "NONE" },
    SignifySignAdd = { link = "LineNr" },
    SignifySignDelete = { link = "LineNr" },
    SignifySignChange = { link = "LineNr" },
    GitGutterAdd = { link = "LineNr" },
    GitGutterDelete = { link = "LineNr" },
    GitGutterChange = { link = "LineNr" },
    GitGutterChangeDelete = { link = "LineNr" },
  }
  
  -- Apply highlights
  for group, settings in pairs(highlights) do
    if settings.link then
      vim.api.nvim_set_hl(0, group, { link = settings.link })
    else
      local hl = {}
      if settings.ctermfg then hl.ctermfg = settings.ctermfg end
      if settings.ctermbg then hl.ctermbg = settings.ctermbg end
      if settings.fg then hl.fg = settings.fg end
      if settings.bg then hl.bg = settings.bg end
      if settings.bold then hl.bold = true end
      if settings.italic then hl.italic = true end
      if settings.underline then hl.underline = true end
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

-- Return the module
return M
