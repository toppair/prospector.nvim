local module = {}

module.load = function(c, config)

  local t = require('prospector.util').tweak_color

  local diagnostics_underline = config.underline_diagnostics and 'underline' or 'none'
  local gui_comments = config.italic_comments and 'italic' or 'none'

  local bg_darken10 = t(c.bg, 0, 0, -10)
  local bg_darken20 = t(c.bg, 0, 0, -20)
  local s2 = t(c.fg, 0, 0, 20)
  local s3 = t(c.fg, 0, 0, 30)
  local s4 = t(c.fg, 0, 0, 40)
  local s6 = t(c.fg, 0, 0, 60)
  local s8 = t(c.fg, 0, 0, 80)
  local error = t(c.red, 10, 0, 10)

  return {
    Normal       = { fg = c.fg, bg = c.bg },
    LineNr       = { fg = s4, bg = c.bg },
    CursorLineNr = { fg = c.fg },
    SignColumn   = { fg = c.fg, bg = c.bg },
    Comment      = { fg = s4, gui = gui_comments },
    Visual       = { bg = bg_darken10 },
    VisualNOS    = { bg = bg_darken10 },
    NormalFloat  = { fg = c.fg, bg = c.bg },
    Pmenu        = { fg = c.fg, bg = t(c.olive, 0, 0, 10) },
    PmenuSel     = { fg = c.fg, bg = c.olive },
    PmenuSbar    = { bg = t(c.olive, 0, 0, 5) },
    PmenuThumb   = { bg = c.olive },
    IncSearch    = { fg = c.bg, bg = c.sky },
    Search       = { fg = c.fg, bg = bg_darken20 },
    Folded       = { fg = s4, bg = bg_darken10 },
    FoldColumn   = { fg = s4, bg = c.bg },
    MatchParen   = { fg = c.fg, bg = bg_darken10, gui = 'bold' },
    ErrorMsg     = { fg = error, bg = c.bg },
    WarningMsg   = { fg = error },
    MsgSeparator = { bg = c.purple },
    EndOfBuffer  = { fg = s6 },
    DiffAdd      = { bg = t(c.bg, 50, 0, -5) },
    DiffChange   = { bg = t(c.bg, 150, 0, -5) },
    DiffDelete   = { bg = t(c.bg, -60, 0, -5) },
    DiffText     = { bg = t(c.bg, 150, 0, -15) },
    TabLine      = { bg = s2 },
    TabLineFill  = { bg = s2 },
    TabLineSel   = { fg = c.blue },
    Title        = { fg = c.blue },
    VertSplit    = { fg = s3, bg = c.bg },
    NonText      = { fg = c.blue },
    SpecialKey   = { fg = c.purple },
    Conceal      = { fg = c.red },
    MoreMsg      = { fg = c.blue },
    Question     = { fg = c.green },
    NormalNC     = { fg = c.fg  },
    ColorColumn  = { bg = c.bg },
    Cursor       = { bg = c.fg  },
    lCursor      = { bg = c.fg },
    CursorIM     = { bg = c.fg },
    CursorColumn = { bg = bg_darken10 },
    CursorLine   = { bg = bg_darken10 },
    TermCursor   = { bg = bg_darken10 },
    TermCursorNC = { bg = c.bg },
    ModeMsg      = { fg = s8, bg = c.bg },
    MsgArea      = { fg = c.fg, bg = c.bg },
    StatusLine   = { fg = c.fg, bg = c.olive },
    Directory    = { fg = c.blue },
    QuickFixLine = { fg = c.fg, bg = bg_darken10 },
    Whitespace   = { fg = c.olive },
    StatusLineNC = { fg = s4, bg = t(c.olive, 0, 0, 10) },
    -- Substitute   = {},
    -- SpellBad     = { },
    -- SpellCap     = { },
    -- SpellLocal   = { },
    -- SpellRare    = { },
    -- WildMenu     = { },

    Foreground     = { fg = c.fg },

    Constant       = { fg = c.blue },
    String         = { fg = c.green },
    Character      = { fg = c.green },
    Number         = { fg = c.blue },
    Boolean        = { fg = c.blue },
    Float          = { fg = c.blue },

    Identifier     = { fg = c.brown },
    Function       = { fg = c.brown },

    Statement      = { fg = c.red },
    Conditional    = { fg = c.red },
    Repeat         = { fg = c.red },
    Label          = { fg = c.fg },
    Operator       = { fg = c.red },
    Keyword        = { fg = c.gray, gui = 'bold' },
    Exception      = { fg = error },

    PreProc        = { fg = c.fg },
    Include        = { fg = c.red },
    Define         = { fg = c.red },
    Macro          = { fg = c.purple },
    PreCondit      = { fg = c.red },

    Type           = { fg = c.gold },
    StorageClass   = { },
    Structure      = { fg = c.gold },
    Typedef        = { fg = c.gold },

    Special        = { fg = c.purple },
    SpecialChar    = { fg = c.fg },
    Tag            = { fg = c.red },
    Delimiter      = { fg = c.red },
    SpecialComment = { fg = c.purple },
    Debug          = { fg = c.purple },

    -- Ignore         = { },
    Error          = { fg = error },
    Todo           = { fg = c.fg, bg = bg_darken20, gui = 'bold' },

    LspReferenceText                      = { bg = bg_darken10 },
    LspReferenceRead                      = { bg = bg_darken10 },
    LspReferenceWrite                     = { bg = bg_darken10, gui = 'bold' },

		LspDiagnosticsError                   = { fg = error },
		LspDiagnosticsWarning                 = { fg = c.gold },
		LspDiagnosticsInformation             = { fg = c.sky },
		LspDiagnosticsHint                    = { fg = c.purple },

    LspDiagnosticsDefaultError            = { fg = error },
    LspDiagnosticsDefaultWarning          = { fg = c.gold },
    LspDiagnosticsDefaultInformation      = { fg = c.sky },
    LspDiagnosticsDefaultHint             = { fg = c.purple },

    LspDiagnosticsVirtualTextError        = { fg = error },
    LspDiagnosticsVirtualTextWarning      = { fg = c.gold },
    LspDiagnosticsVirtualTextInformation  = { fg = c.sky },
    LspDiagnosticsVirtualTextHint         = { fg = c.purple },

    LspDiagnosticsUnderlineError          = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineWarning        = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineInformation    = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineHint           = { fg = 'none', gui = diagnostics_underline },

    LspDiagnosticsFloatingError           = { fg = error },
    LspDiagnosticsFloatingWarning         = { fg = c.gold },
    LspDiagnosticsFloatingInformation     = { fg = c.sky },
    LspDiagnosticsFloatingHint            = { fg = c.purple },

    LspDiagnosticsSignError               = { fg = error },
    LspDiagnosticsSignWarning             = { fg = c.gold },
    LspDiagnosticsSignInformation         = { fg = c.sky },
    LspDiagnosticsSignHint                = { fg = c.purple },

    LspCodeLens                           = { fg = c.gold },

    TSAnnotation         = { fg = c.red },
    TSAttribute          = { fg = c.red },
    TSBoolean            = { fg = c.blue },
    TSCharacter          = { fg = c.green },
    TSComment            = { fg = s4, gui = gui_comments },
    TSConstructor        = { fg = c.purple },
    TSConditional        = { fg = c.red },
    TSConstant           = { fg = c.blue },
    TSConstBuiltin       = { fg = c.blue },
    TSConstMacro         = { fg = c.blue },
    TSError              = { fg = error },
    TSException          = { fg = error },
    TSField              = { fg = c.fg },
    TSFloat              = { fg = c.blue },
    TSFunction           = { fg = c.brown },
    TSFuncBuiltin        = { fg = c.brown },
    TSFuncMacro          = { fg = c.purple },
    TSInclude            = { fg = c.red },
    TSKeyword            = { fg = c.gray, gui = 'bold' },
    TSKeywordFunction    = { fg = c.gray, gui = 'bold' },
    TSLabel              = { fg = c.red },
    TSMethod             = { fg = c.brown },
    TSNamespace          = { fg = c.purple },
    TSNone               = { fg = c.fg },
    TSNumber             = { fg = c.blue },
    TSOperator           = { fg = c.red },
    TSParameter          = { fg = c.fg },
    TSParameterReference = { },
    TSProperty           = { fg = c.fg },
    TSPunctDelimiter     = { fg = s4 },
    TSPunctBracket       = { fg = s4 },
    TSPunctSpecial       = { fg = s4 },
    TSRepeat             = { fg = c.red },
    TSString             = { fg = c.green },
    TSStringRegex        = { fg = c.red },
    TSStringEscape       = { fg = c.brown },
    TSSymbol             = { fg = c.gold },
    TSType               = { fg = c.gold },
    TSTypeBuiltin        = { fg = c.gold },
    TSVariable           = { fg = c.fg },
    TSVariableBuiltin    = { fg = c.purple },

    TSTag                = { fg = c.red },
    TSTagDelimiter       = { fg = s4 },
    TSText               = { fg = c.fg },
    TSEmphasis           = { fg = c.sky },
    TSUnderline          = { gui = 'underline' },
    TSStrike             = { gui = 'strikethrough' },
    TSTitle              = { bg = c.brown },
    -- TSLiteral         = { },
    TSURI                = { fg = c.sky },

    -- markdown
    markdownUrl          = { fg = c.blue, gui = 'underline' },
    markdownLinkText     = { fg = c.blue, gui = 'italic' },
    markdownCode         = { fg = c.gold },
    markdownBlockquote   = { fg = c.fg, gui = 'italic' },
    markdownListMarker   = { fg = c.blue },
    markdownRule         = { fg = s6, gui = 'bold' },

    markdownH1           = { fg = c.fg, gui = 'bold' },
    markdownH2           = { fg = t(c.fg, 0, 0, 10), gui = 'bold' },
    markdownH3           = { fg = t(c.fg, 0, 0, 15), gui = 'bold' },
    markdownH4           = { fg = t(c.fg, 0, 0, 20), gui = 'bold' },
    markdownH5           = { fg = t(c.fg, 0, 0, 25), gui = 'bold' },
    markdownH6           = { fg = t(c.fg, 0, 0, 30), gui = 'bold' },

    markdownH1Delimiter  = { fg = t(c.red, 0, 0, -5), gui ='bold' },
    markdownH2Delimiter  = { fg = c.red, gui = 'bold'  },
    markdownH3Delimiter  = { fg = t(c.red, 0, 0, 5), gui = 'bold' },
    markdownH4Delimiter  = { fg = t(c.red, 0, 0, 10), gui = 'bold' },
    markdownH5Delimiter  = { fg = t(c.red, 0, 0, 15), gui = 'bold' },
    markdownH6Delimiter  = { fg = t(c.red, 0, 0, 20), gui = 'bold' },

    -- help
    helpExample          = { fg = s2, gui = gui_comments },
    helpComment          = { fg = s2, gui = gui_comments },
    helpCommand          = { fg = s2, gui = gui_comments },

    -- Jsdoc
    JSDocName            = { fg = c.purple },
    JSDocType            = { fg = c.gold },

		-- NvimTree
		NvimTreeRootFolder                     = { fg = s4 },
		NvimTreeFolderName                     = { fg = s2 },
		NvimTreeFolderIcon                     = { fg = c.sky },
		NvimTreeEmptyFolderName                = {},
		NvimTreeOpenedFolderName               = { fg = c.fg },
		NvimTreeIndentMarker                   = { fg = c.olive },
		NvimTreeGitDirty                       = { fg = c.red },
		NvimTreeGitNew                         = { fg = c.red },
		NvimTreeGitStaged                      = { fg = c.green },
		NvimTreeGitDeleted                     = { fg = c.red },
		NvimTreeOpenedFile                     = {},
		NvimTreeImageFile                      = { fg = c.green },
		NvimTreeMarkdownFile                   = { fg = c.sky },
		NvimTreeExecFile                       = { fg = c.green },
		NvimTreeSpecialFile                    = { fg = c.sky },

		-- Telescope
		TelescopeNormal                        = { fg = s2, bg = c.bg },
		TelescopePromptBorder                  = { fg = s2 },
		TelescopeResultsBorder                 = { fg = s2 },
		TelescopePreviewBorder                 = { fg = s2 },
		TelescopeSelectionCaret                = { fg = c.sky },
		TelescopeSelection                     = { fg = c.fg, bg = bg_darken10 },
		TelescopeMatching                      = { fg = c.brown },

		-- Dashboard
		DashboardShortCut                      = { fg = c.green },
		DashboardHeader                        = { fg = c.purple },
		DashboardCenter                        = { fg = c.brown },
		DashboardFooter                        = { fg = c.blue },

    -- Cmp
    CmpItemAbbr                            = { fg = c.fg },
    CmpItemAbbrDeprecated                  = { fg = c.red },
    CmpItemAbbrMatch                       = { fg = c.fg },
    CmpItemAbbrMatchFuzzy                  = { fg = c.fg },
    CmpItemKind                            = { fg = c.fg },
    CmpItemMenu                            = { fg = c.fg },

    -- Treesitter-Context
    TreesitterContext                      = { bg = bg_darken10 },

    -- Marks
    MarkSignHL                             = { fg = c.sky },
    MarkSignNumHL                          = { fg = c.sky },
    MarkVirtTextHL                         = { fg = c.sky },

    -- Symbols-Outline
    FocusedSymbol                          = { bg = bg_darken10 },
    SymbolsOutlineConnector                = { fg = s6 },

    -- Fugitive
    diffAdded                              = { bg = t(c.bg, 50, 0, -10) },
    diffLine                               = { bg = t(c.bg, 150, 0, -10) },
    diffRemoved                            = { bg = t(c.bg, -60, 0, -10) },
    fugitiveStagedHeading                  = { fg = c.green },
    fugitiveUntrackedModifier              = { fg = c.red },
    fugitiveUnstagedModifier               = { fg = c.purple },
    fugitiveStagedModifier                 = { fg = c.green },
    fugitiveHash                           = { fg = c.sky },

    -- Dap UI
    DapUIVariable                          = { fg = c.fg },
    DapUIScope                             = { fg = c.brown },
    DapUIType                              = { fg = c.gold },
    DapUIValue                             = { fg = c.fg },
    DapUIModifiedValue                     = { fg = c.sky },
    DapUIDecoration                        = { fg = c.olive },
    DapUIThread                            = { fg = c.fg },
    DapUIStoppedThread                     = { fg = s2 },
    DapUIFrameName                         = { fg = c.fg },
    DapUISource                            = { fg = c.purple },
    DapUILineNumber                        = { fg = c.blue },
    DapUIFloatBorder                       = {},
    DapUIWatchesEmpty                      = { fg = s4 },
    DapUIWatchesValue                      = { fg = c.olive },
    DapUIWatchesError                      = { fg = error },
    DapUIBreakpointsPath                   = { fg = c.brown },
    DapUIBreakpointsInfo                   = {},
    DapUIBreakpointsCurrentLine            = { fg = c.green, bg = bg_darken10, gui = 'bold' },
    DapUIBreakpointsLine                   = { fg = c.blue },

    -- Notify
    NotifyERRORBorder                      = { fg = t(c.red, 0, -70, 40) },
    NotifyWARNBorder                       = { fg = t(c.gold, 0, -70, 40) },
    NotifyINFOBorder                       = { fg = t(c.green, 0, -70, 40) },
    NotifyDEBUGBorder                      = { fg = t(c.blue, 0, -90, 40) },
    NotifyTRACEBorder                      = { fg = t(c.sky, 0, -70, 40) },

    NotifyERRORIcon                        = { fg = t(c.red, 0, 0, 10) },
    NotifyWARNIcon                         = { fg = t(c.gold, 0, 0, 10) },
    NotifyINFOIcon                         = { fg = t(c.green, 0, 0, 10) },
    NotifyDEBUGIcon                        = { fg = t(c.blue, 0, -80, 10) },
    NotifyTRACEIcon                        = { fg = t(c.sky, 0, 0, 10) },

    NotifyERRORTitle                       = { fg = c.red },
    NotifyWARNTitle                        = { fg = c.gold },
    NotifyINFOTitle                        = { fg = c.green },
    NotifyDEBUGTitle                       = { fg = t(c.blue, 0, -80, 0) },
    NotifyTRACETitle                       = { fg = c.sky },
  }

end

return module
