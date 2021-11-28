local module = {}

local default = {
	italic_comments = true,
	terminal_colors = true,
	underline_diagnostics = true,
	groups = {},
}

local config = function(_)
	return default
end

function module.set(cfg)
	local t = type(cfg)
	if t ~= 'function' then
		if t == 'table' then
			config = function()
				return cfg
			end
		end
		return
	end
	config = cfg
end

function module.get(variant)
	local resolved = config(variant)
	return vim.tbl_extend("force", default, type(resolved) == 'table' and resolved or {})
end

return module
