local M = {}
local g = require('domain.global')

M.seeThrough = function()
  vim.cmd[[hi! Normal guibg=NONE ctermbg=NONE]]
  vim.cmd[[hi! CursorLine guibg=#101924 ]]
end

--[[  global Snazz = require('theme').snazz
        args: {theme = string[, pack = string, transp = bool]}

In one call, add and select the colorscheme.
  - if the colorscheme is doom-one and loads as `packadd doom-one.vim`, then:
    snaz('doom-one', 'doom-one.vim')
  - if colorscheme and packadd name are the same, then:
    snaz('doom-one')
  - for local schemes, i.e. in $rtp/colors/ instead of a managed repo, then:
    snaz('doom-one', 'local')
]]

M.snazz = function(opts)
  opts = opts or {}
  setmetatable(opts, {__index = {pack = nil, transp = g.seeThrough}})
  local repo = false
  if not opts.theme then
    error("need to specify a theme. optionally, pack name and transparency")
  elseif opts.pack == 'local' then
    repo = false
  elseif not opts.pack then
    repo = opts.theme
  elseif opts.pack then
    repo = opts.pack
  end
  if repo then
    vim.cmd('packadd ' .. repo)
  end
  require('colorbuddy').colorscheme(opts.theme)
  vim.cmd[[hi! link colorcolumn cursorline]]
  vim.cmd[[hi! link cursorcolumn cursorline]]
  vim.cmd[[hi LineNr guifg=#824020]]
  if opts.transp then
    M.seeThrough()
  end
end


M.default_theme = function()
  if g.seeThrough then
    M.snazz{
      theme = "spacebuddy",
     -- pack = "local",
    }
  else
    M.snazz{
      theme = 'zephyr',
      pack = 'zephyr-nvim'
    }
  end
  require('ploog.vendiline')
  require('ploog.barbar')
end

--[[
modus dark:
  theme = 'modus-vivendi',
  pack = 'modus-theme-vim'

noogie:
  theme = 'noogie',
  pack =
]]

M.default_theme()

return M

-------
