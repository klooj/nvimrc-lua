-- make my func the p func ...

RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

function _G.dumpIt(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function _G.from_file(fname)
  return function()
    local file = io.open(fname)
    local data = "FAILED TO LOAD "..fname
    if file then
      data = file:read "*a"
      file:close()
    end
    return data
  end
end
