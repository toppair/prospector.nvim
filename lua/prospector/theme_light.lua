local module = {}
local t = require('prospector.util').tweak_color

function module.terminal(base)
  return { base.bg, base.red, base.green, base.brown, base.blue, base.purple, base.sky, base.fg }
end

function module.palette(base)
  local palette = {
    bg_darken10 = t(base.bg, 0, 0, -10),
    bg_darken20 = t(base.bg, 0, 0, -20),
    s2 = t(base.fg, 0, 0, 20),
    s3 = t(base.fg, 0, 0, 30),
    s4 = t(base.fg, 0, 0, 40),
    s6 = t(base.fg, 0, 0, 60),
    s8 = t(base.fg, 0, 0, 80),
    error = t(base.red, 10, 0, 10),
  }
  return vim.tbl_extend('force', base, palette)
end

function module.load(base, config)

  local diagnostics_underline = config.underline_diagnostics and 'underline' or 'none'
  local gui_comments = config.italic_comments and 'italic' or 'none'
  local p = module.palette(base)

  return {
    Normal       = { fg = p.fg, bg = p.bg },
    LineNr       = { fg = p.s4, bg = p.bg },
    CursorLineNr = { fg = p.fg },
    SignColumn   = { fg = p.fg, bg = p.bg },
    Comment      = { fg = p.s4, gui = gui_comments },
    Visual       = { bg = p.bg_darken10 },
    VisualNOS    = { bg = p.bg_darken10 },
    NormalFloat  = { fg = p.fg, bg = p.bg },
    Pmenu        = { fg = p.fg, bg = t(p.olive, 0, 0, 10) },
    PmenuSel     = { fg = p.fg, bg = p.olive },
    PmenuSbar    = { bg = t(p.olive, 0, 0, 5) },
    PmenuThumb   = { bg = p.olive },
    IncSearch    = { fg = p.bg, bg = p.sky },
    Search       = { fg = p.fg, bg = p.bg_darken20 },
    Folded       = { fg = p.s4, bg = p.bg_darken10 },
    FoldColumn   = { fg = p.s4, bg = p.bg },
    MatchParen   = { fg = p.fg, bg = p.bg_darken10, gui = 'bold' },
    ErrorMsg     = { fg = p.error, bg = p.bg },
    WarningMsg   = { fg = p.error },
    MsgSeparator = { bg = p.purple },
    EndOfBuffer  = { fg = p.s6 },
    DiffAdd      = { bg = t(p.bg, 50, 0, -5) },
    DiffChange   = { bg = t(p.bg, 150, 0, -5) },
    DiffDelete   = { bg = t(p.bg, -60, 0, -5) },
    DiffText     = { bg = t(p.bg, 150, 0, -15) },
    TabLine      = { bg = p.s2 },
    TabLineFill  = { bg = p.s2 },
    TabLineSel   = { fg = p.blue },
    Title        = { fg = p.blue },
    VertSplit    = { fg = p.s3, bg = p.bg },
    NonText      = { fg = p.blue },
    SpecialKey   = { fg = p.purple },
    Conceal      = { fg = p.red },
    MoreMsg      = { fg = p.blue },
    Question     = { fg = p.green },
    NormalNC     = { fg = p.fg  },
    ColorColumn  = { bg = p.bg },
    Cursor       = { bg = p.fg  },
    lCursor      = { bg = p.fg },
    CursorIM     = { bg = p.fg },
    CursorColumn = { bg = p.bg_darken10 },
    CursorLine   = { bg = p.bg_darken10 },
    TermCursor   = { bg = p.bg_darken10 },
    TermCursorNC = { bg = p.bg },
    ModeMsg      = { fg = p.fg, bg = p.bg },
    MsgArea      = { fg = p.fg, bg = p.bg },
    StatusLine   = { fg = p.fg, bg = p.olive },
    Directory    = { fg = p.blue },
    QuickFixLine = { fg = p.fg, bg = p.bg_darken10 },
    Whitespace   = { fg = p.olive },
    StatusLineNC = { fg = p.s4, bg = t(p.olive, 0, 0, 10) },
    -- Substitute   = {},
    -- SpellBad     = { },
    -- SpellCap     = { },
    -- SpellLocal   = { },
    -- SpellRare    = { },
    -- WildMenu     = { },

    Foreground     = { fg = p.fg },

    Constant       = { fg = p.blue },
    String         = { fg = p.green },
    Character      = { fg = p.green },
    Number         = { fg = p.blue },
    Boolean        = { fg = p.blue },
    Float          = { fg = p.blue },

    Identifier     = { fg = p.brown },
    Function       = { fg = p.brown },

    Statement      = { fg = p.red },
    Conditional    = { fg = p.red },
    Repeat         = { fg = p.red },
    Label          = { fg = p.fg },
    Operator       = { fg = p.red },
    Keyword        = { fg = p.gray, gui = 'bold' },
    Exception      = { fg = p.error },

    PreProc        = { fg = p.fg },
    Include        = { fg = p.red },
    Define         = { fg = p.red },
    Macro          = { fg = p.purple },
    PreCondit      = { fg = p.red },

    Type           = { fg = p.gold },
    StorageClass   = { },
    Structure      = { fg = p.gold },
    Typedef        = { fg = p.gold },

    Special        = { fg = p.purple },
    SpecialChar    = { fg = p.fg },
    Tag            = { fg = p.red },
    Delimiter      = { fg = p.red },
    SpecialComment = { fg = p.purple },
    Debug          = { fg = p.purple },

    -- Ignore         = { },
    Error          = { fg = p.error },
    Todo           = { fg = p.fg, bg = p.bg_darken20, gui = 'bold' },

    LspReferenceText                      = { bg = p.bg_darken10 },
    LspReferenceRead                      = { bg = p.bg_darken10 },
    LspReferenceWrite                     = { bg = p.bg_darken10, gui = 'bold' },

    DiagnosticError			  = { fg = p.error },
    DiagnosticWarn			  = { fg = p.gold },
    DiagnosticInfo			  = { fg = p.sky },
    DiagnosticHint			  = { fg = p.purple },

    LspDiagnosticsError                   = { fg = p.error },
    LspDiagnosticsWarning                 = { fg = p.gold },
    LspDiagnosticsInformation             = { fg = p.sky },
    LspDiagnosticsHint                    = { fg = p.purple },

    LspDiagnosticsDefaultError            = { fg = p.error },
    LspDiagnosticsDefaultWarning          = { fg = p.gold },
    LspDiagnosticsDefaultInformation      = { fg = p.sky },
    LspDiagnosticsDefaultHint             = { fg = p.purple },

    LspDiagnosticsVirtualTextError        = { fg = p.error },
    LspDiagnosticsVirtualTextWarning      = { fg = p.gold },
    LspDiagnosticsVirtualTextInformation  = { fg = p.sky },
    LspDiagnosticsVirtualTextHint         = { fg = p.purple },

    LspDiagnosticsUnderlineError          = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineWarning        = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineInformation    = { fg = 'none', gui = diagnostics_underline },
    LspDiagnosticsUnderlineHint           = { fg = 'none', gui = diagnostics_underline },

    LspDiagnosticsFloatingError           = { fg = p.error },
    LspDiagnosticsFloatingWarning         = { fg = p.gold },
    LspDiagnosticsFloatingInformation     = { fg = p.sky },
    LspDiagnosticsFloatingHint            = { fg = p.purple },

    LspDiagnosticsSignError               = { fg = p.error },
    LspDiagnosticsSignWarning             = { fg = p.gold },
    LspDiagnosticsSignInformation         = { fg = p.sky },
    LspDiagnosticsSignHint                = { fg = p.purple },

    LspCodeLens                           = { fg = p.gold },

    TSAnnotation         = { fg = p.red },
    TSAttribute          = { fg = p.red },
    TSBoolean            = { fg = p.blue },
    TSCharacter          = { fg = p.green },
    TSComment            = { fg = p.s4, gui = gui_comments },
    TSConstructor        = { fg = p.purple },
    TSConditional        = { fg = p.red },
    TSConstant           = { fg = p.blue },
    TSConstBuiltin       = { fg = p.blue },
    TSConstMacro         = { fg = p.blue },
    TSError              = { fg = p.error },
    TSException          = { fg = p.error },
    TSField              = { fg = p.fg },
    TSFloat              = { fg = p.blue },
    TSFunction           = { fg = p.brown },
    TSFuncBuiltin        = { fg = p.brown },
    TSFuncMacro          = { fg = p.purple },
    TSInclude            = { fg = p.red },
    TSKeyword            = { fg = p.gray, gui = 'bold' },
    TSKeywordFunction    = { fg = p.gray, gui = 'bold' },
    TSLabel              = { fg = p.red },
    TSMethod             = { fg = p.brown },
    TSNamespace          = { fg = p.purple },
    TSNone               = { fg = p.fg },
    TSNumber             = { fg = p.blue },
    TSOperator           = { fg = p.red },
    TSParameter          = { fg = p.fg },
    TSParameterReference = { },
    TSProperty           = { fg = p.fg },
    TSPunctDelimiter     = { fg = p.s4 },
    TSPunctBracket       = { fg = p.s4 },
    TSPunctSpecial       = { fg = p.s4 },
    TSRepeat             = { fg = p.red },
    TSString             = { fg = p.green },
    TSStringRegex        = { fg = p.red },
    TSStringEscape       = { fg = p.brown },
    TSSymbol             = { fg = p.gold },
    TSType               = { fg = p.gold },
    TSTypeBuiltin        = { fg = p.gold },
    TSVariable           = { fg = p.fg },
    TSVariableBuiltin    = { fg = p.purple },

    TSTag                = { fg = p.red },
    TSTagDelimiter       = { fg = p.s4 },
    TSText               = { fg = p.fg },
    TSEmphasis           = { fg = p.sky },
    TSUnderline          = { gui = 'underline' },
    TSStrike             = { gui = 'strikethrough' },
    TSTitle              = { bg = p.brown },
    -- TSLiteral         = { },
    TSURI                = { fg = p.sky },

    -- markdown
    markdownUrl          = { fg = p.blue, gui = 'underline' },
    markdownLinkText     = { fg = p.blue, gui = 'italic' },
    markdownCode         = { fg = p.gold },
    markdownBlockquote   = { fg = p.fg, gui = 'italic' },
    markdownListMarker   = { fg = p.blue },
    markdownRule         = { fg = p.s6, gui = 'bold' },

    markdownH1           = { fg = p.fg, gui = 'bold' },
    markdownH2           = { fg = t(p.fg, 0, 0, 10), gui = 'bold' },
    markdownH3           = { fg = t(p.fg, 0, 0, 15), gui = 'bold' },
    markdownH4           = { fg = t(p.fg, 0, 0, 20), gui = 'bold' },
    markdownH5           = { fg = t(p.fg, 0, 0, 25), gui = 'bold' },
    markdownH6           = { fg = t(p.fg, 0, 0, 30), gui = 'bold' },

    markdownH1Delimiter  = { fg = t(p.red, 0, 0, -5), gui ='bold' },
    markdownH2Delimiter  = { fg = p.red, gui = 'bold'  },
    markdownH3Delimiter  = { fg = t(p.red, 0, 0, 5), gui = 'bold' },
    markdownH4Delimiter  = { fg = t(p.red, 0, 0, 10), gui = 'bold' },
    markdownH5Delimiter  = { fg = t(p.red, 0, 0, 15), gui = 'bold' },
    markdownH6Delimiter  = { fg = t(p.red, 0, 0, 20), gui = 'bold' },

    -- help
    helpExample          = { fg = p.s2, gui = gui_comments },
    helpComment          = { fg = p.s2, gui = gui_comments },
    helpCommand          = { fg = p.s2, gui = gui_comments },

    -- Jsdoc
    JSDocName            = { fg = p.purple },
    JSDocType            = { fg = p.gold },

		-- NvimTree
		NvimTreeRootFolder                     = { fg = p.s4 },
		NvimTreeFolderName                     = { fg = p.s2 },
		NvimTreeFolderIcon                     = { fg = p.sky },
		NvimTreeEmptyFolderName                = {},
		NvimTreeOpenedFolderName               = { fg = p.fg },
		NvimTreeIndentMarker                   = { fg = p.olive },
		NvimTreeGitDirty                       = { fg = p.red },
		NvimTreeGitNew                         = { fg = p.red },
		NvimTreeGitStaged                      = { fg = p.green },
		NvimTreeGitDeleted                     = { fg = p.red },
		NvimTreeOpenedFile                     = {},
		NvimTreeImageFile                      = { fg = p.green },
		NvimTreeMarkdownFile                   = { fg = p.sky },
		NvimTreeExecFile                       = { fg = p.green },
		NvimTreeSpecialFile                    = { fg = p.sky },

		-- Telescope
		TelescopeNormal                        = { fg = p.s2, bg = p.bg },
		TelescopePromptBorder                  = { fg = p.s2 },
		TelescopeResultsBorder                 = { fg = p.s2 },
		TelescopePreviewBorder                 = { fg = p.s2 },
		TelescopeSelectionCaret                = { fg = p.sky },
		TelescopeSelection                     = { fg = p.fg, bg = p.bg_darken10 },
		TelescopeMatching                      = { fg = p.brown },

		-- Dashboard
		DashboardShortCut                      = { fg = p.green },
		DashboardHeader                        = { fg = p.purple },
		DashboardCenter                        = { fg = p.brown },
		DashboardFooter                        = { fg = p.blue },

    -- Cmp
    CmpItemAbbr                            = { fg = p.fg },
    CmpItemAbbrDeprecated                  = { fg = p.red },
    CmpItemAbbrMatch                       = { fg = p.fg },
    CmpItemAbbrMatchFuzzy                  = { fg = p.fg },
    CmpItemKind                            = { fg = p.fg },
    CmpItemMenu                            = { fg = p.fg },

    -- Treesitter-Context
    TreesitterContext                      = { bg = p.bg_darken10 },

    -- Marks
    MarkSignHL                             = { fg = p.sky },
    MarkSignNumHL                          = { fg = p.sky },
    MarkVirtTextHL                         = { fg = p.sky },

    -- Symbols-Outline
    FocusedSymbol                          = { bg = p.bg_darken10 },
    SymbolsOutlineConnector                = { fg = p.s6 },

    -- Fugitive
    diffAdded                              = { bg = t(p.bg, 50, 0, -10) },
    diffLine                               = { bg = t(p.bg, 150, 0, -10) },
    diffRemoved                            = { bg = t(p.bg, -60, 0, -10) },
    fugitiveStagedHeading                  = { fg = p.green },
    fugitiveUntrackedModifier              = { fg = p.red },
    fugitiveUnstagedModifier               = { fg = p.purple },
    fugitiveStagedModifier                 = { fg = p.green },
    fugitiveHash                           = { fg = p.sky },

    -- Dap UI
    DapUIVariable                          = { fg = p.fg },
    DapUIScope                             = { fg = p.brown },
    DapUIType                              = { fg = p.gold },
    DapUIValue                             = { fg = p.fg },
    DapUIModifiedValue                     = { fg = p.sky },
    DapUIDecoration                        = { fg = p.olive },
    DapUIThread                            = { fg = p.fg },
    DapUIStoppedThread                     = { fg = p.s2 },
    DapUIFrameName                         = { fg = p.fg },
    DapUISource                            = { fg = p.purple },
    DapUILineNumber                        = { fg = p.blue },
    DapUIFloatBorder                       = {},
    DapUIWatchesEmpty                      = { fg = p.s4 },
    DapUIWatchesValue                      = { fg = p.olive },
    DapUIWatchesError                      = { fg = p.error },
    DapUIBreakpointsPath                   = { fg = p.brown },
    DapUIBreakpointsInfo                   = {},
    DapUIBreakpointsCurrentLine            = { fg = p.green, bg = p.bg_darken10, gui = 'bold' },
    DapUIBreakpointsLine                   = { fg = p.blue },

    -- Notify
    NotifyERRORBorder                      = { fg = t(p.red, 0, -70, 40) },
    NotifyWARNBorder                       = { fg = t(p.gold, 0, -70, 40) },
    NotifyINFOBorder                       = { fg = t(p.green, 0, -70, 40) },
    NotifyDEBUGBorder                      = { fg = t(p.blue, 0, -90, 40) },
    NotifyTRACEBorder                      = { fg = t(p.sky, 0, -70, 40) },

    NotifyERRORIcon                        = { fg = t(p.red, 0, 0, 10) },
    NotifyWARNIcon                         = { fg = t(p.gold, 0, 0, 10) },
    NotifyINFOIcon                         = { fg = t(p.green, 0, 0, 10) },
    NotifyDEBUGIcon                        = { fg = t(p.blue, 0, -80, 10) },
    NotifyTRACEIcon                        = { fg = t(p.sky, 0, 0, 10) },

    NotifyERRORTitle                       = { fg = p.red },
    NotifyWARNTitle                        = { fg = p.gold },
    NotifyINFOTitle                        = { fg = p.green },
    NotifyDEBUGTitle                       = { fg = t(p.blue, 0, -80, 0) },
    NotifyTRACETitle                       = { fg = p.sky },

    -- Lightspeed
    LightspeedGreyWash                     = { fg = p.s4 },
  }

end

return module
