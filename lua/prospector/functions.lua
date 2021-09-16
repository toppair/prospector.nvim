local function prepare()
  vim.cmd 'hi clear'
  vim.cmd 'syntax reset'
  vim.opt.termguicolors = true
  vim.opt.background = 'dark'
  vim.g.colors_name = 'prospector'
end

local function config_with_defaults(config)

  local default = {
    terminal_colors = true,
    underline_diagnostics = true,
  }

  return vim.tbl_extend('force', default, config or {})

end

local function apply_theme(theme)

  for group, style in pairs(theme) do
    local fg = style.fg and ' guifg=' .. style.fg or ' guifg=NONE'
    local bg = style.bg and ' guibg=' .. style.bg or ' guibg=NONE'
    local gui = style.gui and ' gui=' .. style.gui or ' gui=NONE'

    vim.cmd('hi ' .. group  .. fg  .. bg  .. gui)
  end

end

local function apply_terminal_colors(colors)
  vim.g.terminal_color_0 =  colors.bg
  vim.g.terminal_color_1 =  colors.red
  vim.g.terminal_color_2 =  colors.green
  vim.g.terminal_color_3 =  colors.yellow
  vim.g.terminal_color_4 =  colors.blue
  vim.g.terminal_color_5 =  colors.dark
  vim.g.terminal_color_6 =  colors.sky
  vim.g.terminal_color_7 =  colors.fg

  vim.g.terminal_color_8 =  colors.bg
  vim.g.terminal_color_9 =  colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.dark
  vim.g.terminal_color_14 = colors.sky
  vim.g.terminal_color_15 = colors.fg
end

return {
  prepare = prepare,
  config_with_defaults = config_with_defaults,
  apply_theme = apply_theme,
  apply_terminal_colors = apply_terminal_colors,
}
