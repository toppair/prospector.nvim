### Prospector

*Neovim colorscheme*

---

##### dark

![Preview](./preview_dark.png)

##### darker

![Preview](./preview_darker.png)

##### blueberry

![Preview](./preview_blueberry.png)

##### light

![Preview](./preview_light.png)

#### Requirements
- [Neovim](https://github.com/neovim/neovim) >= 0.5
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### Installation
```
use 'toppair/prospector.nvim'
```

#### Usage
```
require('prospector').setup(function(variant)
  -- default:
  return {
    italic_comments = true,
    terminal_colors = true,
    underline_diagnostics = true,
    groups = {}
  }
end)
vim.cmd('colorscheme prospector_' .. 'dark' or 'darker' or 'blueberry' or 'light')
```

##### linking / altering groups
```
{
  groups = {
    TSComment = 'String'                              -- link TSComment group to String group
    TSFunction = { fg = '#ffffff', gui = 'italic' }   -- make function names white and italic
  }
}
```

#### Explicit plugin support
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [DapUI](https://github.com/rcarriga/nvim-dap-ui)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Marks](https://github.com/chentau/marks.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [SymbolsOutline](https://github.com/simrat39/symbols-outline.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [TreesitterContext](https://github.com/romgrk/nvim-treesitter-context)

---
