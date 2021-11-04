local module = {}

module.load = function(c, config)

  local t = require('prospector.util').tweak_color

  local diagnostics_underline = config.underline_diagnostics and 'underline' or 'none'
  local gui_comments = config.italic_comments and 'italic' or 'none'

  local bg_lighten = t(c.bg, 0, 0, 5)
  local s2 = t(c.bg, 0, 0, 10)
  local s3 = t(c.bg, 0, 0, 20)
  local s4 = t(c.bg, 0, 0, 30)
  local s6 = t(c.bg, 0, 0, 50)
  local s8 = t(c.bg, 0, 0, 70)
  local darkerblue = t(c.darkblue, 0, 0, -30)
  local error = t(c.red, 0, 35, 0)

  return {
    Normal       = { fg = c.fg, bg = c.bg },
    LineNr       = { fg = s3, bg = c.bg },
    CursorLineNr = { fg = c.fg },
    SignColumn   = { fg = c.fg, bg = c.bg },
    Comment      = { fg = s3, gui = gui_comments },
    Visual       = { bg = bg_lighten },
    VisualNOS    = { bg = bg_lighten },
    NormalFloat  = { fg = s8, bg = c.bg },
    Pmenu        = { fg = c.fg, bg = s2 },
    PmenuSel     = { fg = c.fg, bg = s3 },
    PmenuSbar    = { bg = s3 },
    PmenuThumb   = { bg = s6 },
    IncSearch    = { fg = c.bg, bg = c.red },
    Search       = { fg = c.fg, bg = darkerblue },
    Folded       = { fg = s4, bg = bg_lighten },
    FoldColumn   = { fg = s3, bg = c.bg },
    MatchParen   = { fg = c.fg, bg = s2, gui = 'bold' },
    ErrorMsg     = { fg = error, bg = c.bg },
    WarningMsg   = { fg = c.darkblue },
    MsgSeparator = { bg = darkerblue },
    EndOfBuffer  = { fg = s3 },
    DiffAdd      = { bg = t(c.bg, 100, 10, 5) },
    DiffChange   = { bg = t(c.bg, 200, 10, 5) },
    DiffDelete   = { bg = t(c.bg, 0, 10, 5) },
    DiffText     = { bg = t(c.bg, 200, 10, 10) },
    TabLine      = { bg = s2 },
    TabLineFill  = { bg = s2 },
    TabLineSel   = { fg = c.darkblue },
    Title        = { fg = c.blue },
    VertSplit    = { fg = s3, bg = c.bg },
    NonText      = { fg = c.blue },
    SpecialKey   = { fg = darkerblue },
    Conceal      = { fg = c.red },
    MoreMsg      = { fg = c.blue },
    Question     = { fg = c.green },
    NormalNC     = { fg = s8  },
    ColorColumn  = { bg = c.bg },
    Cursor       = { bg = darkerblue  },
    lCursor      = { bg = darkerblue },
    CursorIM     = { bg = darkerblue },
    CursorColumn = { bg = bg_lighten },
    CursorLine   = { bg = bg_lighten },
    TermCursor   = { bg = darkerblue },
    TermCursorNC = { bg = c.bg },
    ModeMsg      = { fg = s8, bg = c.bg },
    MsgArea      = { fg = s8, bg = c.bg },
    StatusLine   = { fg = c.fg, bg = s2 },
    Directory    = { fg = c.blue },
    QuickFixLine = { fg = c.fg, bg = darkerblue },
    Whitespace   = { fg = bg_lighten },
    StatusLineNC = { fg = s4, bg = bg_lighten },
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

    Identifier     = { fg = c.yellow },
    Function       = { fg = c.yellow },

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
    Macro          = { fg = c.darkblue },
    PreCondit      = { fg = c.red },

    Type           = { fg = c.yellow },
    StorageClass   = { },
    Structure      = { fg = c.yellow },
    Typedef        = { fg = c.yellow },

    Special        = { fg = c.darkblue },
    SpecialChar    = { fg = c.fg },
    Tag            = { fg = c.red },
    Delimiter      = { fg = c.red },
    SpecialComment = { fg = c.darkblue },
    Debug          = { fg = c.darkblue },

    -- Ignore         = { },
    Error          = { fg = error },
    Todo           = { fg = c.fg, bg = darkerblue, gui = 'bold' },

    LspReferenceText                      = { bg = bg_lighten },
    LspReferenceRead                      = { bg = bg_lighten },
    LspReferenceWrite                     = { bg = bg_lighten, gui = 'bold' },

		LspDiagnosticsError                   = { fg = c.red },
		LspDiagnosticsWarning                 = { fg = c.yellow },
		LspDiagnosticsInformation             = { fg = c.sky },
		LspDiagnosticsHint                    = { fg = c.darkblue },

    LspDiagnosticsDefaultError            = { fg = error },
    LspDiagnosticsDefaultWarning          = { fg = c.yellow },
    LspDiagnosticsDefaultInformation      = { fg = c.sky },
    LspDiagnosticsDefaultHint             = { fg = c.darkblue },

    LspDiagnosticsVirtualTextError        = { fg = error },
    LspDiagnosticsVirtualTextWarning      = { fg = c.yellow },
    LspDiagnosticsVirtualTextInformation  = { fg = c.sky },
    LspDiagnosticsVirtualTextHint         = { fg = c.darkblue },

    LspDiagnosticsUnderlineError          = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineWarning        = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineInformation    = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineHint           = { fg = 'none', gui = diagnostics_underline },

    LspDiagnosticsFloatingError           = { fg = error },
    LspDiagnosticsFloatingWarning         = { fg = c.yellow },
    LspDiagnosticsFloatingInformation     = { fg = c.sky },
    LspDiagnosticsFloatingHint            = { fg = c.darkblue },

    LspDiagnosticsSignError               = { fg = error },
    LspDiagnosticsSignWarning             = { fg = c.yellow },
    LspDiagnosticsSignInformation         = { fg = c.sky },
    LspDiagnosticsSignHint                = { fg = c.darkblue },

    LspCodeLens                           = { fg = c.yellow },

    TSAnnotation         = { fg = c.red },
    TSAttribute          = { fg = c.red },
    TSBoolean            = { fg = c.blue },
    TSCharacter          = { fg = c.green },
    TSComment            = { fg = s3, gui = gui_comments },
    TSConstructor        = { fg = c.darkblue },
    TSConditional        = { fg = c.red },
    TSConstant           = { fg = c.blue },
    TSConstBuiltin       = { fg = c.blue },
    TSConstMacro         = { fg = c.blue },
    TSError              = { fg = error },
    TSException          = { fg = error },
    TSField              = { fg = c.fg },
    TSFloat              = { fg = c.blue },
    TSFunction           = { fg = t(c.yellow, 0, 0, -5) },
    TSFuncBuiltin        = { fg = c.yellow },
    TSFuncMacro          = { fg = c.darkblue },
    TSInclude            = { fg = c.red },
    TSKeyword            = { fg = c.gray, gui = 'bold' },
    TSKeywordFunction    = { fg = c.gray, gui = 'bold' },
    TSLabel              = { fg = c.red },
    TSMethod             = { fg = t(c.yellow, 0, 0, -5) },
    TSNamespace          = { fg = c.darkblue },
    TSNone               = { fg = c.fg },
    TSNumber             = { fg = c.blue },
    TSOperator           = { fg = c.red },
    TSParameter          = { fg = s8 },
    TSParameterReference = { },
    TSProperty           = { fg = s8 },
    TSPunctDelimiter     = { fg = s4 },
    TSPunctBracket       = { fg = s4 },
    TSPunctSpecial       = { fg = s4 },
    TSRepeat             = { fg = c.red },
    TSString             = { fg = c.green },
    TSStringRegex        = { fg = c.red },
    TSStringEscape       = { fg = c.yellow },
    TSSymbol             = { fg = c.yellow },
    TSType               = { fg = c.yellow },
    TSTypeBuiltin        = { fg = c.yellow },
    TSVariable           = { fg = c.fg },
    TSVariableBuiltin    = { fg = c.darkblue },

    TSTag                = { fg = c.red },
    TSTagDelimiter       = { fg = s4 },
    TSText               = { fg = s8 },
    TSEmphasis           = { fg = c.sky },
    TSUnderline          = { gui = 'underline' },
    TSStrike             = { gui = 'strikethrough' },
    TSTitle              = { bg = darkerblue },
    -- TSLiteral         = { },
    TSURI                = { fg = c.sky },

    -- markdown
    markdownUrl          = { fg = c.blue, gui = 'underline' },
    markdownLinkText     = { fg = c.sky, gui = 'italic' },
    markdownCode         = { fg = c.yellow },
    markdownBlockquote   = { fg = c.fg, gui = 'italic' },
    markdownListMarker   = { fg = c.blue },
    markdownRule         = { fg = s3, gui = 'bold' },

    markdownH1           = { fg = c.fg, gui = 'bold' },
    markdownH2           = { fg = t(c.fg, 0, 0, -5), gui = 'bold' },
    markdownH3           = { fg = t(c.fg, 0, 0, -10), gui = 'bold' },
    markdownH4           = { fg = t(c.fg, 0, 0, -15), gui = 'bold' },
    markdownH5           = { fg = t(c.fg, 0, 0, -20), gui = 'bold' },
    markdownH6           = { fg = t(c.fg, 0, 0, -25), gui = 'bold' },

    markdownH1Delimiter  = { fg = t(c.red, 0, 0, -20), gui ='bold' },
    markdownH2Delimiter  = { fg = t(c.red, 0, 0, -15), gui = 'bold'  },
    markdownH3Delimiter  = { fg = t(c.red, 0, 0, -10), gui = 'bold' },
    markdownH4Delimiter  = { fg = t(c.red, 0, 0, -5), gui = 'bold' },
    markdownH5Delimiter  = { fg = c.red, gui = 'bold' },
    markdownH6Delimiter  = { fg = t(c.red, 0, 0, 5), gui = 'bold' },

    -- help
    helpExample          = { fg = s6, gui = gui_comments },
    helpComment          = { fg = s6, gui = gui_comments },
    helpCommand          = { fg = s6, gui = gui_comments },

    -- Jsdoc
    JSDocName            = { fg = t(c.darkblue, 0, 0, -20) },
    JSDocType            = { fg = c.yellow },

		-- NvimTree
		NvimTreeRootFolder                     = { fg = s4 },
		NvimTreeFolderName                     = { fg = s6 },
		NvimTreeFolderIcon                     = { fg = c.sky },
		NvimTreeEmptyFolderName                = {},
		NvimTreeOpenedFolderName               = { fg = c.fg },
		NvimTreeIndentMarker                   = { fg = darkerblue },
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
		TelescopeNormal                        = { fg = s6, bg = c.bg },
		TelescopePromptBorder                  = { fg = c.darkblue },
		TelescopeResultsBorder                 = { fg = c.darkblue },
		TelescopePreviewBorder                 = { fg = c.darkblue },
		TelescopeSelectionCaret                = { fg = c.sky },
		TelescopeSelection                     = { fg = c.fg, bg = bg_lighten },
		TelescopeMatching                      = { fg = c.yellow },

		-- Dashboard
		DashboardShortCut                      = { fg = c.green },
		DashboardHeader                        = { fg = darkerblue },
		DashboardCenter                        = { fg = c.yellow },
		DashboardFooter                        = { fg = darkerblue },

    -- Cmp
    CmpItemAbbr                            = { fg = c.fg },
    CmpItemAbbrDeprecated                  = { fg = c.red },
    CmpItemAbbrMatch                       = { fg = c.fg },
    CmpItemAbbrMatchFuzzy                  = { fg = c.fg },
    CmpItemKind                            = { fg = c.fg },
    CmpItemMenu                            = { fg = c.fg },

    -- Treesitter-Context
    TreesitterContext                      = { bg = bg_lighten },

    -- Marks
    MarkSignHL                             = { fg = c.sky },
    MarkSignNumHL                          = { fg = c.sky },
    MarkVirtTextHL                         = { fg = c.sky },

    -- Symbols-Outline
    FocusedSymbol                          = { bg = bg_lighten },
    SymbolsOutlineConnector                = { fg = s2 },

    -- Fugitive
    diffAdded                              = { bg = t(c.bg, 100, 20, 10) },
    diffLine                               = { bg = t(c.bg, 200, 20, 10) },
    diffRemoved                            = { bg = t(c.bg, 0, 20, 10) },
    fugitiveStagedHeading                  = { fg = c.green },
    fugitiveUntrackedModifier              = { fg = c.red },
    fugitiveUnstagedModifier               = { fg = c.darkblue },
    fugitiveStagedModifier                 = { fg = c.green },

    -- Dap UI
    DapUIVariable                          = { fg = c.fg },
    DapUIScope                             = { fg = c.darkblue },
    DapUIType                              = { fg = c.yellow },
    DapUIValue                             = { fg = c.fg },
    DapUIModifiedValue                     = { fg = c.sky },
    DapUIDecoration                        = { fg = darkerblue },
    DapUIThread                            = { fg = c.darkblue },
    DapUIStoppedThread                     = { fg = c.darkblue },
    DapUIFrameName                         = { fg = c.fg },
    DapUISource                            = { fg = c.darkblue },
    DapUILineNumber                        = { fg = c.blue },
    DapUIFloatBorder                       = {},
    DapUIWatchesEmpty                      = { fg = s3 },
    DapUIWatchesValue                      = { fg = darkerblue },
    DapUIWatchesError                      = { fg = error },
    DapUIBreakpointsPath                   = { fg = c.darkblue },
    DapUIBreakpointsInfo                   = {},
    DapUIBreakpointsCurrentLine            = { fg = c.green, gui = 'bold' },
    DapUIBreakpointsLine                   = { fg = c.blue },

    -- Notify
    NotifyERRORBorder                      = { fg = t(c.red, 0, -20, -40) },
    NotifyWARNBorder                       = { fg = t(c.yellow, 0, -20, -40) },
    NotifyINFOBorder                       = { fg = t(c.green, 0, -20, -40) },
    NotifyDEBUGBorder                      = { fg = t(c.blue, 0, -30, -40) },
    NotifyTRACEBorder                      = { fg = t(c.sky, 0, -20, -40) },

    NotifyERRORIcon                        = { fg = t(c.red, 0, 0, -15) },
    NotifyWARNIcon                         = { fg = t(c.yellow, 0, 0, -15) },
    NotifyINFOIcon                         = { fg = t(c.green, 0, 0, -15) },
    NotifyDEBUGIcon                        = { fg = t(c.blue, 0, -30, -15) },
    NotifyTRACEIcon                        = { fg = t(c.sky, 0, 0, -15) },

    NotifyERRORTitle                       = { fg = c.red },
    NotifyWARNTitle                        = { fg = c.yellow },
    NotifyINFOTitle                        = { fg = c.green },
    NotifyDEBUGTitle                       = { fg = t(c.blue, 0, -30, 0) },
    NotifyTRACETitle                       = { fg = c.sky },

    -- Lightspeed
    LightspeedGreyWash                     = { fg = s3 },
  }

end

return module
