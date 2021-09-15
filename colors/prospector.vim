hi clear
syntax reset
set termguicolors
set background=dark
g.colors_name = 'prospector'
lua package.loaded['prospector'] = nil
lua require('prospector').load()
