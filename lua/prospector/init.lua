local module = {}

module.setup = function(cfg)

  if vim.g.colors_name == 'prospector' then
    return
  end

  local colors = require('prospector.colors')
  local fn = require('prospector.functions')

  local config = fn.config_with_defaults(cfg)
  local theme = fn.load_theme(colors, config)

  fn.prepare(config)
  fn.apply_theme(theme)
  fn.set_dev_icons(config)

  if config.terminal_colors then
    fn.apply_terminal_colors(colors, config)
  end

end

return module
