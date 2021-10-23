local function prepare(config)
  vim.cmd 'hi clear'
  vim.cmd 'syntax reset'
  vim.opt.termguicolors = true
  vim.opt.background = config.variant == 'light' and 'light' or 'dark'
  vim.g.colors_name = 'prospector'
end

local function config_with_defaults(config)

  local default = {
    variant = 'dark',
    italic_comments = true,
    terminal_colors = true,
    underline_diagnostics = true,
    groups = {}
  }

  return vim.tbl_extend('force', default, config or {})

end

local function load_theme(colors, config)

  if config.variant == 'light' then
    return require('prospector.theme_light').load(colors.light, config)
  else
    return require('prospector.theme_dark').load(colors.dark, config)
  end

end

local function apply_theme(theme)

  for group, style in pairs(theme) do
    local fg = style.fg and ' guifg=' .. style.fg or ' guifg=NONE'
    local bg = style.bg and ' guibg=' .. style.bg or ' guibg=NONE'
    local gui = style.gui and ' gui=' .. style.gui or ' gui=NONE'

    vim.cmd('hi ' .. group  .. fg  .. bg  .. gui)
  end

end

local function apply_terminal_colors(colors, config)

  if config.variant == 'light' then

    colors = colors.light

    vim.g.terminal_color_0 =  colors.bg
    vim.g.terminal_color_1 =  colors.red
    vim.g.terminal_color_2 =  colors.green
    vim.g.terminal_color_3 =  colors.brown
    vim.g.terminal_color_4 =  colors.blue
    vim.g.terminal_color_5 =  colors.purple
    vim.g.terminal_color_6 =  colors.sky
    vim.g.terminal_color_7 =  colors.fg

    vim.g.terminal_color_8 =  colors.bg
    vim.g.terminal_color_9 =  colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.brown
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.purple
    vim.g.terminal_color_14 = colors.sky
    vim.g.terminal_color_15 = colors.fg

  else

    colors = colors.dark

    vim.g.terminal_color_0 =  colors.bg
    vim.g.terminal_color_1 =  colors.red
    vim.g.terminal_color_2 =  colors.green
    vim.g.terminal_color_3 =  colors.yellow
    vim.g.terminal_color_4 =  colors.blue
    vim.g.terminal_color_5 =  colors.d45
    vim.g.terminal_color_6 =  colors.sky
    vim.g.terminal_color_7 =  colors.fg

    vim.g.terminal_color_8 =  colors.bg
    vim.g.terminal_color_9 =  colors.red
    vim.g.terminal_color_10 = colors.green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.blue
    vim.g.terminal_color_13 = colors.d45
    vim.g.terminal_color_14 = colors.sky
    vim.g.terminal_color_15 = colors.fg

  end

end

local function setup_plugins(config)
  local plugins = require('prospector.plugins')

  for _, setup in pairs(plugins) do
    setup(config)
  end
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

return {
  apply_terminal_colors = apply_terminal_colors,
  apply_theme = apply_theme,
  config_with_defaults = config_with_defaults,
  load_theme = load_theme,
  merge_groups = merge_groups,
  prepare = prepare,
  setup_plugins = setup_plugins
}
