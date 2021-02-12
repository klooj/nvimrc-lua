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
