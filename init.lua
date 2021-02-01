-- In lua files,  use `<localleader>g` like `gf`
vim = vim
local options = require('domain.options')
local aucmd = require('domain.autocommands')

local vg = vim.g
function VG(name,opts)
  for k,v in pairs(opts) do
    vg[name .. k] = v
  end
end

local disable_vplugs = function()
  local vplgs = { 'gzip', 'tar', 'tarPlugin', 'zip', 'zipPlugin', 'getscript', 'getscriptPlugin',
    'vimball', 'vimballPlugin', 'matchit', 'matchparen', '2html_plugin', 'logiPat', 'rrhelper',
    'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers'}
  for i = 1, #vplgs do
    local pk =  "loaded_" .. vplgs[i]
    vg[pk] =  1
  end
end

local leader_map = function()
  vg.mapleader = " "
  vg.maplocalleader = '\\'
  vim.fn.nvim_set_keymap('n',' ','',{noremap = true})
  vim.fn.nvim_set_keymap('x',' ','',{noremap = true})
  vim.fn.nvim_set_keymap('n','\\','',{noremap = true})
  vim.fn.nvim_set_keymap('x','\\','',{noremap = true})
end

disable_vplugs()
leader_map()
options:load_options()
require('publibs.pfunc')

vim.api.nvim_command('filetype plugin indent on')
if vim.fn.has('vim_starting') == 1 then
  vim.api.nvim_command('syntax enable')
end

require('domain.keymaps')
aucmd.load_autocmds()

vim.cmd[[call which_key#register('<Space>', "g:which_key_map")]]
vim.cmd[[call which_key#register('\\', "g:lo_key_map")]]
--------------
