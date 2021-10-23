local function setup_dev_icons(config)

  if config.variant == 'light' then

    local status, dev_icons = pcall(require, 'nvim-web-devicons')

    if status then

      local util = require('prospector.util')
      local icons = dev_icons.get_icons()

      for _, conf in pairs(icons) do
        conf.color = util.tweak_color(conf.color, 0, 50, -20)
      end

    end
  end

end

local function setup_symbols_outline()

  local status, symbols = pcall(require, 'symbols-outline.config')

  if status then
    symbols.defaults.preview_bg_highlight = 'Normal'
  end

end

return {
  setup_dev_icons = setup_dev_icons,
  setup_symbols_outline = setup_symbols_outline
}
