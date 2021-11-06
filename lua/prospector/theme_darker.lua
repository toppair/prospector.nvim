local module = {}
local dark = require('prospector.theme_dark')

module.terminal = function()
  return dark.terminal()
end

module.palette = function(base)
  return dark.palette(base)
end

module.load = function(palette, config)

  local t = require('prospector.util').tweak_color
  local p = palette

  local darker = {
    DiffAdd      = { bg = t(p.bg, 100, 15, 5) },
    DiffChange   = { bg = t(p.bg, 200, 15, 5) },
    DiffDelete   = { bg = t(p.bg, 0, 15, 5) },
    DiffText     = { bg = t(p.bg, 200, 15, 10) },
  }

  return vim.tbl_extend('force', dark.load(palette, config), darker)
end

return module
