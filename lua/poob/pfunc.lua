-- make my func the p func ...

local relmod = require('plenary.reload').reload_module

R = function(name)
	relmod(name)
	return require(name)
end

P = function(v)
	print(vim.inspect(v))
	return v
end

Dumper = function(...)
	local objects = vim.tbl_map(vim.inspect, {...})
	print(unpack(objects))
end

Snazz = function(...)
	require('plugin.theme').snazz(...)
end

LWK = function(t)
	t = t or {}
	local ll = 	require('klooj.wk').ll
	for k, v in pairs(ll) do
		t[k] = v
	end
	VG('lo_key_map', t)
end

-- KJ = function()
-- 	require('klooj.utils')
-- end

--local kj = require('klooj.utils')
--KJ = function(m, ...)
--.[m](...)
