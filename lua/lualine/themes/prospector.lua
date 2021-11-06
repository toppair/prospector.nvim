
local variant = vim.g.prospector_variant or 'dark'

local themes = {

  dark = function()

    local c = {
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

  end,

  darker = function()

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

  end,

  light = function()

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

  end,

  blueberry = function()

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
      command = {
        a = { fg = c.darkgray, bg = c.purple, gui = 'bold' },
        b = { fg = c.fg, bg = c.darker, gui = 'bold' }
      },
      inactive = {
        a = { fg = c.fg, bg = c.darker },
        b = { fg = c.fg, bg = c.darker },
        c = { fg = c.fg, bg = c.darker },
      }
    }

  end,
}

return themes[variant]()
