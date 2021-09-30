if vim.o.background == 'light' then

  local colors = {
    fg1 = '#fafafa',
    fg2 = '#000000',
    bg = '#c1c884',
    blue = '#003366',
    red = '#660000',
    brown = '#662200',
    gold = '#665500',
  }

  return {
    normal = {
      a = {fg = colors.fg1, bg = colors.brown, gui = 'bold'},
      b = {fg = colors.fg2, bg = colors.bg, gui = 'bold'},
      c = {fg = colors.fg2, bg = colors.bg}
    },
    insert = {
      a = {fg = colors.fg1, bg = colors.blue, gui = 'bold'},
    },
    visual = {
      a = {fg = colors.fg1, bg = colors.gold, gui = 'bold'},
    },
    replace = {
      a = {fg = colors.fg1, bg = colors.red, gui = 'bold'},
    },
    inactive = {
      a = {fg = colors.fg2, bg = colors.bg},
      b = {fg = colors.fg2, bg = colors.bg},
      c = {fg = colors.fg2, bg = colors.bg}
    }
  }

else

  local colors = {
    fg       = '#e6e6e6',
    dark     = '#33434d',
    darker   = '#263238',
    darkgray = '#333333',
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

end
