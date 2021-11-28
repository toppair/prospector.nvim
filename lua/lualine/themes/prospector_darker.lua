local c = {
  fg       = '#e6e6e6',
  dark     = '#33434d',
  darker   = '#263238',
  darkgray = '#222222',
  red      = '#d19494',
  blue     = '#94b3d1',
  yellow   = '#d1cc94',
}

return {
  normal = {
    a = { fg = c.fg, bg = c.darker, gui = 'bold' },
    b = { fg = c.fg, bg = c.dark, gui = 'bold' },
    c = { fg = c.fg, bg = c.darkgray }
  },
  insert = {
    a = { fg = c.darkgray, bg = c.blue, gui = 'bold' },
    b = { fg = c.fg, bg = c.darker, gui = 'bold' }
  },
  visual = {
    a = { fg = c.darkgray, bg = c.yellow, gui = 'bold' },
    b = { fg = c.fg, bg = c.darker, gui = 'bold' }
  },
  replace = {
    a = { fg = c.darkgray, bg = c.red, gui = 'bold' },
    b = { fg = c.fg, bg = c.darker, gui = 'bold' }
  },
  inactive = {
    a = { fg = c.fg, bg = c.darker },
    b = { fg = c.fg, bg = c.darker },
    c = { fg = c.fg, bg = c.darker },
  }
}
