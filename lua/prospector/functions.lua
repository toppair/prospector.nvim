local module = {}
local colors = require('prospector.colors')
local opt = vim.opt
local g = vim.g
local nvim_command = vim.api.nvim_command

local function prepare(config)
  opt.termguicolors = true
  opt.background = config.variant == 'light' and 'light' or 'dark'
  nvim_command('hi clear')
  g.colors_name = 'prospector_' .. config.variant
end

local function apply_theme(theme)
  for group, style in pairs(theme) do
    nvim_command('hi ' .. group  .. ' guifg=' .. (style.fg or 'NONE') .. ' guibg=' .. (style.bg or 'NONE') .. ' gui=' .. (style.gui or 'NONE'))
  end
end

local function apply_terminal_colors(c)
  for i, color in pairs(c) do
    g['terminal_color_' .. i - 1] = color
  end
end

local function setup_plugins(config)
  local p = require('prospector.plugins')
  p.setup_devicons(config)
  p.setup_fugitive(config)
  p.setup_symbols_outline(config)
end

local function merge_groups(theme, groups)
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

function module.set_scheme(variant)
  if g.colors_name == 'prospector_' .. variant then
    return
  end
  local config = require('prospector.config').get(variant)
  config.variant = variant
  local base = colors[variant]
  local theme = require('prospector.theme_' .. variant)
  local final = merge_groups(
    require('prospector.common_extends')(
      theme.load(base, config)
    ),
    config.groups
  )
  prepare(config)
  setup_plugins(config)
  apply_theme(final)
  if config.terminal_colors then
    apply_terminal_colors(theme.terminal(base))
  end
end

return module
