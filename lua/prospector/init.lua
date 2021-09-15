local module = {}

module.load = function(config)

  local colors = require('prospector.colors')
  local fn = require('prospector.functions')

  local cfg = fn.config(config)
  local theme = require('prospector.theme').load(colors, cfg)

  fn.apply(colors, theme)

end

return module
