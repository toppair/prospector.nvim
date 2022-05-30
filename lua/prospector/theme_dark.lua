local module = {}
local t = require('prospector.util').tweak_color

function module.terminal(base)
    return { base.bg, base.red, base.green, base.yellow, base.blue, base.darkblue, base.sky, base.fg }
end

function module.palette(base)
    local palette = {
        bg_lighten = t(base.bg, 0, 0, 5),
        s2 = t(base.bg, 0, 0, 10),
        s3 = t(base.bg, 0, 0, 20),
        s4 = t(base.bg, 0, 0, 30),
        s6 = t(base.bg, 0, 0, 50),
        s8 = t(base.bg, 0, 0, 70),
        darkerblue = t(base.darkblue, 0, 0, -30),
        error = t(base.red, 0, 35, 0),
    }
    return vim.tbl_extend('force', base, palette)
end

function module.load(base, config)
    local diagnostics_underline = config.underline_diagnostics and 'underline' or 'none'
    local gui_comments = config.italic_comments and 'italic' or 'none'
    local p = module.palette(base)

    -- stylua: ignore
    return {
      Normal       = { fg = p.fg, bg = p.bg },
      LineNr       = { fg = p.s3, bg = p.bg },
      CursorLineNr = { fg = p.fg },
      SignColumn   = { fg = p.fg, bg = p.bg },
      Comment      = { fg = p.s4, gui = gui_comments },
      Visual       = { bg = p.bg_lighten },
      VisualNOS    = { bg = p.bg_lighten },
      NormalFloat  = { fg = p.s8, bg = p.s2 },
      FloatBorder  = { fg = p.s4, bg = p.s2 },
      Pmenu        = { fg = p.fg, bg = p.s2 },
      PmenuSel     = { fg = p.fg, bg = p.s3 },
      PmenuSbar    = { bg = p.s3 },
      PmenuThumb   = { bg = p.s6 },
      IncSearch    = { fg = p.bg, bg = p.red },
      Search       = { fg = p.fg, bg = p.darkerblue },
      Folded       = { fg = p.s4, bg = p.bg_lighten },
      FoldColumn   = { fg = p.s3, bg = p.bg },
      MatchParen   = { fg = p.fg, bg = p.s2, gui = 'bold' },
      ErrorMsg     = { fg = p.error, bg = p.bg },
      WarningMsg   = { fg = p.darkblue },
      MsgSeparator = { bg = p.darkerblue },
      EndOfBuffer  = { fg = p.s3 },
      DiffAdd      = { bg = t(p.bg, 100, 10, 5) },
      DiffChange   = { bg = t(p.bg, 200, 10, 5) },
      DiffDelete   = { bg = t(p.bg, 0, 10, 5) },
      DiffText     = { bg = t(p.bg, 200, 10, 10) },
      TabLine      = { bg = p.s2 },
      TabLineFill  = { bg = p.bg_lighten },
      TabLineSel   = { fg = p.darkblue },
      Title        = { fg = p.blue },
      VertSplit    = { fg = p.s2, bg = p.bg },
      NonText      = { fg = p.blue },
      SpecialKey   = { fg = p.darkerblue },
      Conceal      = { fg = p.red },
      MoreMsg      = { fg = p.blue },
      Question     = { fg = p.green },
      NormalNC     = { fg = p.s8  },
      ColorColumn  = { bg = p.bg },
      Cursor       = { bg = p.darkerblue  },
      lCursor      = { bg = p.darkerblue },
      CursorIM     = { bg = p.darkerblue },
      CursorColumn = { bg = p.bg_lighten },
      CursorLine   = { bg = p.bg_lighten },
      TermCursor   = { bg = p.darkerblue },
      TermCursorNC = { bg = p.bg },
      ModeMsg      = { fg = p.s8, bg = p.bg },
      MsgArea      = { fg = p.s8, bg = p.bg },
      Directory    = { fg = p.blue },
      QuickFixLine = { fg = p.fg, bg = p.darkerblue },
      Whitespace   = { fg = p.bg_lighten },
      StatusLine   = { fg = p.fg, bg = p.s2 },
      StatusLineNC = { fg = p.s6, bg = p.bg_lighten },
      -- Substitute   = {},
      -- SpellBad     = { },
      -- SpellCap     = { },
      -- SpellLocal   = { },
      -- SpellRare    = { },
      -- WildMenu     = { },

      Constant       = { fg = p.darkblue, gui = 'bold' },
      String         = { fg = p.green },
      Character      = { fg = p.green },
      Number         = { fg = p.blue },
      Boolean        = { fg = p.blue },
      Float          = { fg = p.blue },

      Identifier     = { fg = p.gray, gui = 'bold' },
      Function       = { fg = p.yellow },

      Statement      = { fg = p.gray, gui = 'bold' },
      Conditional    = { fg = p.red },
      Repeat         = { fg = p.red },
      Label          = { fg = p.fg },
      Operator       = { fg = p.red },
      Keyword        = { fg = p.gray, gui = 'bold' },
      Exception      = { fg = p.error },

      PreProc        = { fg = p.fg },
      Include        = { fg = p.red },
      Define         = { fg = p.red },
      Macro          = { fg = p.yellow, gui = 'italic' },
      PreCondit      = { fg = p.red },

      Type           = { fg = t(p.yellow, 0, 0, -5) },
      StorageClass   = { },
      Structure      = { fg = p.yellow },
      Typedef        = { fg = p.yellow },

      Special        = { fg = p.darkblue },
      SpecialChar    = { fg = p.fg },
      Tag            = { fg = p.red },
      Delimiter      = { fg = p.red },
      SpecialComment = { fg = p.darkblue },
      Debug          = { fg = p.darkblue },

      -- Ignore         = { },
      Error          = { fg = p.error },
      Todo           = { fg = p.fg, bg = p.darkerblue, gui = 'bold' },

      LspReferenceText      = { bg = p.bg_lighten },
      LspReferenceRead      = { bg = p.bg_lighten },
      LspReferenceWrite     = { bg = p.bg_lighten, gui = 'bold' },

      DiagnosticError			  = { fg = p.error },
      DiagnosticWarn			  = { fg = p.yellow },
      DiagnosticInfo			  = { fg = p.sky },
      DiagnosticHint			  = { fg = p.darkblue },

      LspDiagnosticsError                   = { fg = p.error },
      LspDiagnosticsWarning                 = { fg = p.yellow },
      LspDiagnosticsInformation             = { fg = p.sky },
      LspDiagnosticsHint                    = { fg = p.darkblue },

      LspDiagnosticsDefaultError            = { fg = p.error },
      LspDiagnosticsDefaultWarning          = { fg = p.yellow },
      LspDiagnosticsDefaultInformation      = { fg = p.sky },
      LspDiagnosticsDefaultHint             = { fg = p.darkblue },

      LspDiagnosticsVirtualTextError        = { fg = p.error },
      LspDiagnosticsVirtualTextWarning      = { fg = p.yellow },
      LspDiagnosticsVirtualTextInformation  = { fg = p.sky },
      LspDiagnosticsVirtualTextHint         = { fg = p.darkblue },

      LspDiagnosticsUnderlineError          = { fg = 'none', gui = diagnostics_underline },
      LspDiagnosticsUnderlineWarning        = { fg = 'none', gui = diagnostics_underline },
      LspDiagnosticsUnderlineInformation    = { fg = 'none', gui = diagnostics_underline },
      LspDiagnosticsUnderlineHint           = { fg = 'none', gui = diagnostics_underline },

      LspDiagnosticsFloatingError           = { fg = p.error },
      LspDiagnosticsFloatingWarning         = { fg = p.yellow },
      LspDiagnosticsFloatingInformation     = { fg = p.sky },
      LspDiagnosticsFloatingHint            = { fg = p.darkblue },

      LspDiagnosticsSignError               = { fg = p.error },
      LspDiagnosticsSignWarning             = { fg = p.yellow },
      LspDiagnosticsSignInformation         = { fg = p.sky },
      LspDiagnosticsSignHint                = { fg = p.darkblue },

      LspCodeLens                           = { fg = p.yellow },

      TSAnnotation         = { fg = p.red },
      TSAttribute          = { fg = p.red },
      TSBoolean            = { fg = p.blue },
      TSCharacter          = { fg = p.green },
      TSComment            = { fg = p.s4, gui = gui_comments },
      TSConstructor        = { fg = p.yellow },
      TSConditional        = { fg = p.red },
      TSConstant           = { fg = p.darkblue, gui = 'bold' },
      TSConstBuiltin       = { fg = p.blue, gui = 'bold' },
      TSConstMacro         = { fg = p.blue },
      TSError              = { fg = p.error },
      TSException          = { fg = p.error },
      TSField              = { fg = t(p.bg, 0, 0, 65) },
      TSFloat              = { fg = p.blue },
      TSFunction           = { fg = t(p.yellow, 0, 0, -5) },
      TSFuncBuiltin        = { fg = t(p.yellow, 0, 0, -10), gui = 'bold' },
      TSFuncMacro          = { fg = p.yellow, gui = 'italic' },
      TSInclude            = { fg = p.red },
      TSKeyword            = { fg = p.gray, gui = 'bold' },
      TSKeywordFunction    = { fg = p.gray, gui = 'bold' },
      TSKeywordOperator    = { fg = p.gray, gui = 'bold' },
      TSKeywordReturn      = { fg = p.gray, gui = 'bold' },
      TSLabel              = { fg = p.red },
      TSMethod             = { fg = t(p.yellow, 0, 0, -5) },
      TSNamespace          = { fg = p.darkblue, gui = 'bold' },
      TSNone               = { fg = p.fg },
      TSNumber             = { fg = p.blue },
      TSOperator           = { fg = p.red },
      TSParameter          = { fg = p.s8 },
      TSParameterReference = { },
      TSProperty           = { fg = p.s8 },
      TSPunctDelimiter     = { fg = p.s4 },
      TSPunctBracket       = { fg = p.s4 },
      TSPunctSpecial       = { fg = p.s4 },
      TSRepeat             = { fg = p.red },
      TSString             = { fg = p.green },
      TSStringRegex        = { fg = t(p.green, 0, 0, -10), gui = 'bold' },
      TSStringEscape       = { fg = p.yellow },
      TSStringSpecial      = { fg = p.yellow },
      TSSymbol             = { fg = p.yellow },
      TSType               = { fg = t(p.yellow, 0, 0, -5) },
      TSTypeBuiltin        = { fg = t(p.yellow, 0, 0, -5), gui = 'bold' },
      TSVariable           = { fg = p.fg },
      TSVariableBuiltin    = { fg = p.darkblue },

      TSTag                = { fg = p.red },
      TSTagAttribute       = { fg = p.s8 },
      TSTagDelimiter       = { fg = p.s4 },
      TSText               = { fg = p.s8 },
      TSStrong             = { gui = 'bold' },
      TSEmphasis           = { fg = p.sky },
      TSUnderline          = { gui = 'underline' },
      TSStrike             = { gui = 'strikethrough' },
      TSTitle              = { fg = p.fg, gui = 'bold' },
      -- TSLiteral         = {},
      TSURI                = { fg = p.sky },
      TSMath               = { fg = p.blue },
      TSTextReference      = { gui = 'italic' },
      -- TSEnvironment        = {},
      -- TSEnvironmentName    = {},
      TSNote               = { fg = t(p.blue, 0, 0, -5), gui = 'bold' },
      TSWarning            = { fg = t(p.yellow, 0, 0, -5), gui = 'bold' },
      TSDanger             = { fg = t(p.red, 0, 0, -5), gui = 'bold' },

      -- lua
      luaTSConstructor     = { fg = p.darkblue },
      luaTSKeywordOperator = { fg = p.red },
      luaFunction          = { fg = p.gray, gui = 'bold' },
      luaFunc              = { fg = t(p.yellow, 0, 0, -5) },

      -- typescript
      typescriptParens           = { fg = p.fg, bg = p.s2 },
      typescriptDOMDocMethod     = { fg = t(p.yellow, 0, 0, -5) },
      typescriptTypeReference    = { fg = p.yellow },
      typescriptFuncType         = { fg = p.s8 },
      typescriptPredefinedType   = { fg = t(p.yellow, 0, 0, -5), gui = 'bold' },
      typescriptMember           = { fg = t(p.bg, 0, 0, 65) },
      typescriptBOMNavigatorProp = { fg = t(p.yellow, 0, 0, -5) },
      typescriptAliasDeclaration = { fg = p.yellow },
      typescriptClassName        = { fg = p.yellow },
      typescriptXHRMethod        = { fg = t(p.yellow, 0, 0, -5) },

      -- rust
      rustModPath               = { fg = p.darkblue, gui = 'bold' },

      -- markdown
      markdownUrl          = { fg = p.blue, gui = 'underline' },
      markdownLinkText     = { fg = p.sky, gui = 'italic' },
      markdownCode         = { bg = p.bg_lighten },
      markdownBlockquote   = { fg = p.fg, gui = 'italic' },
      markdownListMarker   = { fg = p.blue },
      markdownRule         = { fg = p.s3, gui = 'bold' },

      markdownH1           = { fg = p.fg, gui = 'bold' },
      markdownH2           = { fg = t(p.fg, 0, 0, -5), gui = 'bold' },
      markdownH3           = { fg = t(p.fg, 0, 0, -10), gui = 'bold' },
      markdownH4           = { fg = t(p.fg, 0, 0, -15), gui = 'bold' },
      markdownH5           = { fg = t(p.fg, 0, 0, -20), gui = 'bold' },
      markdownH6           = { fg = t(p.fg, 0, 0, -25), gui = 'bold' },

      markdownH1Delimiter  = { fg = t(p.red, 0, 0, -20), gui ='bold' },
      markdownH2Delimiter  = { fg = t(p.red, 0, 0, -15), gui = 'bold'  },
      markdownH3Delimiter  = { fg = t(p.red, 0, 0, -10), gui = 'bold' },
      markdownH4Delimiter  = { fg = t(p.red, 0, 0, -5), gui = 'bold' },
      markdownH5Delimiter  = { fg = p.red, gui = 'bold' },
      markdownH6Delimiter  = { fg = t(p.red, 0, 0, 5), gui = 'bold' },

      -- help
      helpExample          = { fg = p.s6, gui = gui_comments },
      helpComment          = { fg = p.s6, gui = gui_comments },
      helpCommand          = { fg = p.s6, gui = gui_comments },

      -- Jsdoc
      JSDocName            = { fg = t(p.darkblue, 0, 0, -20) },
      JSDocType            = { fg = p.yellow },

      -- NvimTree
      NvimTreeRootFolder                     = { fg = p.s4 },
      NvimTreeFolderName                     = { fg = p.s6 },
      NvimTreeFolderIcon                     = { fg = p.sky },
      NvimTreeEmptyFolderName                = {},
      NvimTreeOpenedFolderName               = { fg = p.fg },
      NvimTreeIndentMarker                   = { fg = p.darkerblue },
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
      TelescopeNormal                        = { fg = p.s6, bg = p.bg },
      TelescopePromptBorder                  = { fg = p.darkblue },
      TelescopeResultsBorder                 = { fg = p.darkblue },
      TelescopePreviewBorder                 = { fg = p.darkblue },
      TelescopeSelectionCaret                = { fg = p.sky },
      TelescopeSelection                     = { fg = p.fg, bg = p.bg_lighten },
      TelescopeMatching                      = { fg = p.yellow },

      -- Dashboard
      DashboardShortCut                      = { fg = p.green },
      DashboardHeader                        = { fg = p.darkerblue },
      DashboardCenter                        = { fg = p.yellow },
      DashboardFooter                        = { fg = p.darkerblue },

      -- Cmp
      CmpItemAbbr                            = { fg = p.fg },
      CmpItemAbbrDeprecated                  = { fg = p.red },
      CmpItemAbbrMatch                       = { fg = p.fg },
      CmpItemAbbrMatchFuzzy                  = { fg = p.fg },
      CmpItemKind                            = { fg = p.fg },
      CmpItemMenu                            = { fg = p.s8 },
      CmpDocumentation                       = { fg = p.s8, bg = p.s2 },
      CmpDocumentationBorder                 = { fg = p.s4, bg = p.s2 },

      -- Treesitter-Context
      TreesitterContext                      = { bg = p.bg_lighten },

      -- Marks
      MarkSignHL                             = { fg = p.sky },
      MarkSignNumHL                          = { fg = p.sky },
      MarkVirtTextHL                         = { fg = p.sky },

      -- Symbols-Outline
      FocusedSymbol                          = { bg = p.bg_lighten },
      SymbolsOutlineConnector                = { fg = p.s2 },

      -- Fugitive
      diffAdded                              = { bg = t(p.bg, 100, 20, 10) },
      diffLine                               = { bg = t(p.bg, 200, 20, 10) },
      diffRemoved                            = { bg = t(p.bg, 0, 20, 10) },
      fugitiveStagedHeading                  = { fg = p.green },
      fugitiveUntrackedModifier              = { fg = p.red },
      fugitiveUnstagedModifier               = { fg = p.darkblue },
      fugitiveStagedModifier                 = { fg = p.green },

      -- Dap UI
      DapUIVariable                          = { fg = p.fg },
      DapUIScope                             = { fg = p.darkblue },
      DapUIType                              = { fg = p.yellow },
      DapUIValue                             = { fg = p.fg },
      DapUIModifiedValue                     = { fg = p.sky },
      DapUIDecoration                        = { fg = p.darkerblue },
      DapUIThread                            = { fg = p.darkblue },
      DapUIStoppedThread                     = { fg = p.darkblue },
      DapUIFrameName                         = { fg = p.fg },
      DapUISource                            = { fg = p.darkblue },
      DapUILineNumber                        = { fg = p.blue },
      DapUIFloatBorder                       = {},
      DapUIWatchesEmpty                      = { fg = p.s3 },
      DapUIWatchesValue                      = { fg = p.darkerblue },
      DapUIWatchesError                      = { fg = p.error },
      DapUIBreakpointsPath                   = { fg = p.darkblue },
      DapUIBreakpointsInfo                   = {},
      DapUIBreakpointsCurrentLine            = { fg = p.green, gui = 'bold' },
      DapUIBreakpointsLine                   = { fg = p.blue },

      -- Notify
      NotifyERRORBorder                      = { fg = t(p.red, 0, -20, -40) },
      NotifyWARNBorder                       = { fg = t(p.yellow, 0, -20, -40) },
      NotifyINFOBorder                       = { fg = t(p.green, 0, -20, -40) },
      NotifyDEBUGBorder                      = { fg = t(p.blue, 0, -30, -40) },
      NotifyTRACEBorder                      = { fg = t(p.sky, 0, -20, -40) },

      NotifyERRORIcon                        = { fg = t(p.red, 0, 0, -15) },
      NotifyWARNIcon                         = { fg = t(p.yellow, 0, 0, -15) },
      NotifyINFOIcon                         = { fg = t(p.green, 0, 0, -15) },
      NotifyDEBUGIcon                        = { fg = t(p.blue, 0, -30, -15) },
      NotifyTRACEIcon                        = { fg = t(p.sky, 0, 0, -15) },

      NotifyERRORTitle                       = { fg = p.red },
      NotifyWARNTitle                        = { fg = p.yellow },
      NotifyINFOTitle                        = { fg = p.green },
      NotifyDEBUGTitle                       = { fg = t(p.blue, 0, -30, 0) },
      NotifyTRACETitle                       = { fg = p.sky },

      -- Gitsigns
      GitSignsAdd                            = { fg = t(p.green, 0, 30, -30) },
      GitSignsChange                         = { fg = t(p.blue, 0, 30, -30) },
      GitSignsDelete                         = { fg = t(p.red, 0, 30, -30) },
    }
end

return module
