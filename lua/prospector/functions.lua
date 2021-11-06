local module = {}
local colors = require('prospector.colors')

module.prepare = function(config)
  vim.cmd 'hi clear'
  vim.cmd 'syntax reset'
  vim.opt.termguicolors = true
  vim.opt.background = config.variant == 'light' and 'light' or 'dark'
  vim.g.colors_name = 'prospector'
  vim.g.prospector_variant = config.variant
end

module.config_with_defaults = function(config)

  if not colors[config.variant] then
    config.variant = 'dark'
  end

  local default = {
    variant = 'dark',
    italic_comments = true,
    terminal_colors = true,
    underline_diagnostics = true,
    groups = {},
  }

  return vim.tbl_extend('force', default, config or {})
end

module.apply_theme = function(theme)

  for group, style in pairs(theme) do
    local fg = style.fg and ' guifg=' .. style.fg or ' guifg=NONE'
    local bg = style.bg and ' guibg=' .. style.bg or ' guibg=NONE'
    local gui = style.gui and ' gui=' .. style.gui or ' gui=NONE'

    vim.cmd('hi ' .. group  .. fg  .. bg  .. gui)
  end

end

module.set_scheme = function(cfg)
  local config = module.config_with_defaults(cfg)
  local theme = require('prospector.theme_' .. config.variant)
  local base = colors[config.variant]
  local merged = module.merge_groups(
    theme.load(theme.palette(base), config), config.groups
  )

  module.prepare(config)
  module.setup_plugins(config)
  module.apply_theme(merged)

  if config.terminal_colors then
    module.apply_terminal_colors(theme.terminal())
  end
end

module.apply_terminal_colors = function(c)

  for i, color in pairs(c) do
    vim.g['terminal_color_' .. i - 1] = color
  end

end

module.setup_plugins = function(config)
  local plugins = require('prospector.plugins')

  for _, setup in pairs(plugins) do
    setup(config)
  end
end

module.merge_groups = function(theme, groups)

  for group, style in pairs(groups) do
    if type(style) == 'string' then
      theme[group] = theme[style] or {}
    else
      for key, value in pairs(style) do
        theme[group][key] = value
      end
    end
  end

  return theme
end

return module
