local M = {}
local maps
-- local should_reload = true
-- local reloader = function()
-- 	if should_reload then
-- 		require('plenary.reload').reload_module('plenary')
-- 		require('plenary.reload').reload_module('klooj.wk')
-- 	end
-- end

local ll = {
	['<CR>'] = 'link split',
	t = {
		name = '+treesitter',
	},
	x = 'toggle checkbox',
}

M.lwk = function(t)
	t = t or {}
	vim.g.lo_key_map = {}
	maps = vim.tbl_extend(t, ll)
	-- for k, v in pairs(ll) do
		-- t[k] = v
	-- end
	return VG('lo_key_map', maps)
end

return M
	-- setmetatable()
-- M.lo = function(t)
-- 	t = t or {}
-- 	for k, v in pairs(M.ll) do
-- 		t[k] = v
-- 	end
-- 	VG('lo_key_map', t)
-- end

-- return setmetatable({}, {
	-- __index = function(_, k)
		-- reloader()

		-- if M[k] then
			-- return M[k]
		-- end
	-- end
-- })
