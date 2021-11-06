local module = {}

module.setup = function(config)

  if vim.g.colors_name == 'prospector' then
    return
  end

  require('prospector.functions').set_scheme(config)
end

return module
