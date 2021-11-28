local module = {}

local devicons = {}
local modified = false

local function restore_devicons()
  for name, conf in pairs(require('nvim-web-devicons').get_icons()) do
    conf.color = devicons[name]
  end
end

function module.setup_devicons(config)
  if config.variant == 'light' then
    local status, dev_icons = pcall(require, 'nvim-web-devicons')
    if status then
      local util = require('prospector.util')
      for name, conf in pairs(dev_icons.get_icons()) do
        devicons[name] = conf.color
        conf.color = util.tweak_color(conf.color, 0, 50, -20)
      end
      modified = true
    end
  elseif modified then
    restore_devicons()
    modified = false
  end
end

function module.setup_symbols_outline(_)
  local status, symbols = pcall(require, 'symbols-outline.config')
  if status then
    symbols.defaults.preview_bg_highlight = 'Normal'
  end
end

function module.setup_fugitive(config)
  vim.g.fugitive_dynamic_colors = config.variant == 'light' and 0 or 1
end

return module
