local module = {}
local dark = require('prospector.theme_dark')

function module.terminal(base)
    return dark.terminal(base)
end

function module.palette(base)
    return dark.palette(base)
end

function module.load(base, config)
    local t = require('prospector.util').tweak_color
    local p = module.palette(base)

    -- stylua: ignore
    local darker = {
      DiffAdd      = { bg = t(p.bg, 100, 15, 5) },
      DiffChange   = { bg = t(p.bg, 200, 15, 5) },
      DiffDelete   = { bg = t(p.bg, 0, 15, 5) },
      DiffText     = { bg = t(p.bg, 200, 15, 10) },
    }

    return vim.tbl_extend('force', dark.load(base, config), darker)
end

return module
