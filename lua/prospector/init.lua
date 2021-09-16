local module = {}

module.load = function(cfg)

  local colors = require('prospector.colors')
  local fn = require('prospector.functions')

  local config = fn.config_with_defaults(cfg)
  local theme = require('prospector.theme').load(colors, config)

  fn.prepare()
  fn.apply_theme(theme)

  if config.terminal_colors then
    fn.apply_terminal_colors(colors)
  end

end

return module
