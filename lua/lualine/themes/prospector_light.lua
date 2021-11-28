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
