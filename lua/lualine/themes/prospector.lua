local colors = {
  fg       = '#e6e6e6',
  darkgray = '#333333',
  dark     = '#33434d',
  darker   = '#263238',
  red      = '#d19494',
  blue     = '#94b3d1',
  yellow   = '#d1cc94',
}

return {
  normal = {
    a = {fg = colors.fg, bg = colors.darker, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.dark, gui = 'bold'},
    c = {fg = colors.fg, bg = colors.darkgray}
  },
  insert = {
    a = {fg = colors.darkgray, bg = colors.blue, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.darker, gui = 'bold'}
  },
  visual = {
    a = {fg = colors.darkgray, bg = colors.yellow, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.darker, gui = 'bold'}
  },
  replace = {
    a = {fg = colors.darkgray, bg = colors.red, gui = 'bold'},
    b = {fg = colors.fg, bg = colors.darker, gui = 'bold'}
  },
  inactive = {
    a = {fg = colors.fg, bg = colors.darker},
    b = {fg = colors.fg, bg = colors.darker},
    c = {fg = colors.fg, bg = colors.darker}
  }
}