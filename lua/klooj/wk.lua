local M = {}

M.ll = {
	['<CR>'] = 'link split',
	t = {
		name = '+treesitter',
	},
	x = 'toggle checkbox',
}

-- M.lo = function(t)
-- 	t = t or {}
-- 	for k, v in pairs(M.ll) do
-- 		t[k] = v
-- 	end
-- 	VG('lo_key_map', t)
-- end

return M
