return function(theme)
  local groups = {
    CmpItemKindText               = theme.TSString,
    CmpItemKindMethod	      		  = theme.TSMethod,
    CmpItemKindFunction	      		= theme.TSFunction,
    CmpItemKindConstructor    		= theme.TSConstructor,
    CmpItemKindField	      		  = theme.TSProperty,
    CmpItemKindVariable	      		= theme.TSVariable,
    CmpItemKindClass	      		  = theme.TSType,
    CmpItemKindInterface      		= theme.TSType,
    CmpItemKindModule	      		  = theme.TSNamespace,
    CmpItemKindProperty	      		= theme.TSProperty,
    CmpItemKindUnit	      		    = theme.TSProperty,
    CmpItemKindValue	      		  = theme.TSProperty,
    CmpItemKindEnum	      		    = theme.TSProperty,
    CmpItemKindKeyword	      		= theme.TSKeyword,
    CmpItemKindSnippet	      		= theme.TSLabel,
    CmpItemKindColor	      		  = theme.TSEmphasis,
    CmpItemKindFile	      		    = theme.TSEmphasis,
    CmpItemKindReference      		= theme.TSProperty,
    CmpItemKindFolder	      		  = theme.Directory,
    CmpItemKindEnumMember     		= theme.TSProperty,
    CmpItemKindConstant	      		= theme.TSConstant,
    CmpItemKindStruct	      		  = theme.TSType,
    CmpItemKindEvent	      		  = theme.TSProperty,
    CmpItemKindOperator	      		= theme.TSOperator,
    CmpItemKindTypeParameter  		= theme.TSType,

    -- Lightspeed
    LightspeedGreyWash            = theme.TSComment,
  }
  return vim.tbl_extend('force', theme, groups)
end
