vim.cmd[[autocmd BufWritePre *.py execute ':Black']]

-- g = require('domain.global')
-- local opts = {
  -- virtualenv = g.home .. ".pyenv/shims/black"
-- }
-- VG('black_', opts)


--[==[
Defaults
fast = 0,
linelength = 88,
skip_string_normalization = 0,
quiet = 0
  virtualenv = g.home .. ".local/share/nvim/black"

]==]
