local c = {
  fg       = '#e6e6e6',
  dark     = '#0d0f1c',
  darker   = '#181c34',
  darkgray = '#181c34',
  red = '#E48181',
  blue = '#8181e4',
  orange = '#E4C381',
  purple = '#e481e4',
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
    a = { fg = c.darkgray, bg = c.orange, gui = 'bold' },
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
