local function apply(colors, theme)

  for group, style in pairs(theme) do
    local fg = style.fg and ' guifg=' .. style.fg or ' guifg=NONE'
    local bg = style.bg and ' guibg=' .. style.bg or ' guibg=NONE'
    local gui = style.gui and ' gui=' .. style.gui or ' gui=NONE'

    vim.cmd('hi ' .. group  .. fg  .. bg  .. gui)
  end


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

local function config(cfg)

  local default = {
    underline_diagnostics = false
  }

  return vim.tbl_extend('force', default, cfg or {})

end

return { apply = apply, config = config }
