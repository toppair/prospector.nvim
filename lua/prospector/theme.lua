local theme = {}

theme.load = function(c, config)

  local diagnostics_underline = config.underline_diagnostics and 'underline' or 'none'

  local groups = {
    Normal       = { fg = c.fg, bg = c.bg },
    LineNr       = { fg = c.s3, bg = c.bg },
    CursorLineNr = { fg = c.fg },
    SignColumn   = { fg = c.fg, bg = c.bg },
    Comment      = { fg = c.s4 },
    Visual       = { bg = c.bg_lighten5 },
    VisualNOS    = { bg = c.bg_lighten5 },
    NormalFloat  = { fg = c.s8, bg = c.bg },
    Pmenu        = { fg = c.fg, bg = c.s2 },
    PmenuSel     = { fg = c.fg, bg = c.s3 },
    PmenuSbar    = { bg = c.s3 },
    PmenuThumb   = { bg = c.s6 },
    IncSearch    = { fg = c.bg, bg = c.red },
    Search       = { fg = c.fg, bg = c.d25 },
    Folded       = { fg = c.s4, bg = c.s2 },
    FoldColumn   = { fg = c.s6, bg = c.s2 },
    MatchParen   = { fg = c.fg, bg = c.s2, gui = 'bold' },
    ErrorMsg     = { fg = c.error, bg = c.bg },
    WarningMsg   = { fg = c.d55 },
    MsgSeparator = { bg = c.d25 },
    EndOfBuffer  = { fg = c.s3 },
    DiffAdd      = { fg = c.bg, bg = c.green },
    DiffChange   = { fg = c.bg, bg = c.d45 },
    DiffDelete   = { fg = c.bg, bg = c.red },
    DiffText     = { fg = c.fg, bg = c.d25 },
    TabLine      = { bg = c.s2 },
    TabLineFill  = { bg = c.s2 },
    TabLineSel   = { fg = c.d45 },
    Title        = { fg = c.blue },
    VertSplit    = { fg = c.s3, bg = c.bg },
    NonText      = { fg = c.blue },
    SpecialKey   = { fg = c.d25 },
    Conceal      = { fg = c.red },
    MoreMsg      = { fg = c.blue },
    Question     = { fg = c.green },
    NormalNC     = { fg = c.s8  },
    -- ColorColumn  =  {},
    Cursor       = { bg = c.d25  },
    lCursor      = { bg = c.d25 },
    CursorIM     = { bg = c.d25 },
    CursorColumn = { bg = c.bg_lighten5 },
    CursorLine   = { bg = c.bg_lighten5 },
    TermCursor   = { bg = c.d25 },
    TermCursorNC = { bg = c.bg },
    ModeMsg      = { fg = c.s8, bg = c.bg },
    MsgArea      = { fg = c.s8, bg = c.bg },
    StatusLine   = { bg = c.s2 },
    Directory    = { fg = c.blue },
    QuickFixLine = { fg = c.yellow, bg = c.d25 },
    -- Substitute   = {},
    -- SpellBad     = { },
    -- SpellCap     = { },
    -- SpellLocal   = { },
    -- SpellRare    = { },
    -- StatusLineNC = { },
    -- Whitespace   = { },
    -- WildMenu     = { },

    Foreground     = { fg = c.fg },

    Constant       = { fg = c.blue },
    String         = { fg = c.green },
    Character      = { fg = c.green },
    Number         = { fg = c.blue },
    Boolean        = { fg = c.blue },
    Float          = { fg = c.blue },

    Identifier     = { fg = c.yellow },
    Function       = { fg = c.yellow },

    Statement      = { fg = c.red },
    Conditional    = { fg = c.red },
    Repeat         = { fg = c.red },
    Label          = { fg = c.fg },
    Operator       = { fg = c.red },
    Keyword        = { fg = c.gray, gui = 'bold' },
    Exception      = { fg = c.error },

    PreProc        = { fg = c.fg },
    Include        = { fg = c.red },
    Define         = { fg = c.red },
    Macro          = { fg = c.d55 },
    PreCondit      = { fg = c.red },

    Type           = { fg = c.yellow },
    StorageClass   = { },
    Structure      = { fg = c.yellow },
    Typedef        = { fg = c.yellow },

    Special        = { fg = c.d65 },
    SpecialChar    = { fg = c.fg },
    Tag            = { fg = c.red },
    Delimiter      = { fg = c.red },
    SpecialComment = { fg = c.d65 },
    Debug          = { fg = c.d45 },

    -- Ignore         = { },
    Error          = { fg = c.error },
    Todo           = { fg = c.fg, bg = c.d25, gui = 'bold' },

    -- LspReferenceText   = { },
    -- LspReferenceRead   = { },
    -- LspReferenceWrite  = { },

    LspDiagnosticsDefaultError            = { fg = c.error },
    LspDiagnosticsDefaultWarning          = { fg = c.yellow },
    LspDiagnosticsDefaultInformation      = { fg = c.sky },
    LspDiagnosticsDefaultHint             = { fg = c.d55 },

    LspDiagnosticsVirtualTextError        = { fg = c.error },
    LspDiagnosticsVirtualTextWarning      = { fg = c.yellow },
    LspDiagnosticsVirtualTextInformation  = { fg = c.sky },
    LspDiagnosticsVirtualTextHint         = { fg = c.d45 },

    LspDiagnosticsUnderlineError          = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineWarning        = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineInformation    = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineHint           = { fg = 'none', gui = diagnostics_underline },

    LspDiagnosticsFloatingError           = { fg = c.error },
    LspDiagnosticsFloatingWarning         = { fg = c.yellow },
    LspDiagnosticsFloatingInformation     = { fg = c.sky },
    LspDiagnosticsFloatingHint            = { fg = c.d55 },

    LspDiagnosticsSignError               = { fg = c.error },
    LspDiagnosticsSignWarning             = { fg = c.yellow },
    LspDiagnosticsSignInformation         = { fg = c.sky },
    LspDiagnosticsSignHint                = { fg = c.d55 },

    LspCodeLens                           = { fg = c.yellow },

    TSAnnotation         = { fg = c.red },
    TSAttribute          = { fg = c.red },
    TSBoolean            = { fg = c.blue },
    TSCharacter          = { fg = c.green },
    TSComment            = { fg = c.s3 },
    TSConstructor        = { fg = c.d55 },
    TSConditional        = { fg = c.red },
    TSConstant           = { fg = c.blue },
    TSConstBuiltin       = { fg = c.blue },
    TSConstMacro         = { fg = c.blue },
    TSError              = { fg = c.error },
    TSException          = { fg = c.error },
    TSField              = { fg = c.fg },
    TSFloat              = { fg = c.blue },
    TSFunction           = { fg = c.yellow },
    TSFuncBuiltin        = { fg = c.darkyellow },
    TSFuncMacro          = { fg = c.d55 },
    TSInclude            = { fg = c.red },
    TSKeyword            = { fg = c.gray, gui = 'bold' },
    TSKeywordFunction    = { fg = c.gray, gui = 'bold' },
    TSLabel              = { fg = c.red },
    TSMethod             = { fg = c.darkyellow },
    TSNamespace          = { fg = c.d55 },
    TSNone               = { fg = c.fg },
    TSNumber             = { fg = c.blue },
    TSOperator           = { fg = c.red },
    TSParameter          = { fg = c.s8 },
    TSParameterReference = { },
    TSProperty           = { fg = c.s8 },
    TSPunctDelimiter     = { fg = c.s4 },
    TSPunctBracket       = { fg = c.s4 },
    TSPunctSpecial       = { fg = c.s4 },
    TSRepeat             = { fg = c.red },
    TSString             = { fg = c.green },
    TSStringRegex        = { fg = c.red },
    TSStringEscape       = { fg = c.yellow },
    TSSymbol             = { fg = c.yellow },
    TSType               = { fg = c.yellow },
    TSTypeBuiltin        = { fg = c.yellow },
    TSVariable           = { fg = c.light },
    TSVariableBuiltin    = { fg = c.d55 },

    TSTag                = { fg = c.red },
    TSTagDelimiter       = { fg = c.s4 },
    TSText               = { fg = c.s8 },
    TSEmphasis           = { fg = c.sky },
    TSUnderline          = { gui = 'underline' },
    TSStrike             = { gui = 'strikethrough' },
    TSTitle              = { bg = c.d25 },
    -- TSLiteral         = { },
    TSURI                = { fg = c.sky },

    -- Jsdoc
    JSDocName = { fg = c.d35 },
    JSDocType = { fg = c.yellow },

		-- NvimTree
		NvimTreeRootFolder                     = { fg = c.d55 },
		NvimTreeFolderName                     = { fg = c.blue },
		NvimTreeFolderIcon                     = { fg = c.sky },
		NvimTreeEmptyFolderName                = {},
		NvimTreeOpenedFolderName               = { fg = c.blue },
		NvimTreeIndentMarker                   = { fg = c.d25 },
		NvimTreeGitDirty                       = {},
		NvimTreeGitNew                         = {},
		NvimTreeGitStaged                      = {},
		NvimTreeGitDeleted                     = {},
		NvimTreeOpenedFile                     = {},
		NvimTreeImageFile                      = {},
		NvimTreeMarkdownFile                   = {},
		NvimTreeExecFile                       = { fg = c.green },
		NvimTreeSpecialFile                    = { fg = c.sky },
		LspDiagnosticsError                    = { fg = c.red },
		LspDiagnosticsWarning                  = { fg = c.yellow },
		LspDiagnosticsInformation              = { fg = c.sky },
		LspDiagnosticsHint                     = { fg = c.d65 },

		-- Telescope
		TelescopeNormal                        = { fg = c.s6, bg = c.bg },
		TelescopePromptBorder                  = { fg = c.d55 },
		TelescopeResultsBorder                 = { fg = c.d55 },
		TelescopePreviewBorder                 = { fg = c.d55 },
		TelescopeSelectionCaret                = { fg = c.sky },
		TelescopeSelection                     = { fg = c.fg, bg = c.bg_lighten5 },
		TelescopeMatching                      = { fg = c.yellow },

		-- Dashboard
		DashboardShortCut                      = { fg = c.green },
		DashboardHeader                        = { fg = c.d25 },
		DashboardCenter                        = { fg = c.yellow },
		DashboardFooter                        = { fg = c.d25 }
  }

  return groups
end

return theme