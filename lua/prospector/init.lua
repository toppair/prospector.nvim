local module = {}

module.setup = function(cfg)
	require('prospector.config').set(cfg)
end

return module
