local options = require('domain.options')
local aucmd = require('domain.autocommands')

--[=[ helper function for declaring vim.global options in config files.
  this accepts nested tables and is equivalent to let g:what#this='that' or vim.g[[what#this]] = 'that'
  usage: VG('optionprefix', table)
  for example:
    local opts = {this = 'that', here = 'there', but = { why = 'because', how = 'lua magic'}}
    VG('what#', opts)
]=]
local vg = vim.g
function VG(name, opts)
  for k, v in pairs(opts) do
    vg[name .. k] = v
  end
end

-- i do not use any of these default plugins. the intention is to speed up loading time.
local disable_vplugs = function()
  local vplgs = { 'gzip', 'tar', 'tarPlugin', 'zip', 'zipPlugin', 'getscript', 'getscriptPlugin',
    'vimball', 'vimballPlugin', 'matchit', 'matchparen', '2html_plugin', 'logiPat', 'rrhelper',
    'netrw', 'netrwSettings', 'netrwPlugin', 'netrwFileHandlers'}
  for i = 1, #vplgs do
    local pk =  "loaded_" .. vplgs[i]
    vg[pk] =  1
  end
end

local leader_map = function()
  vg.mapleader = " "
  vg.maplocalleader = '\\'
  vim.api.nvim_set_keymap('n',' ','',{noremap = true})
  vim.api.nvim_set_keymap('x',' ','',{noremap = true})
  vim.api.nvim_set_keymap('n','\\','',{noremap = true})
  vim.api.nvim_set_keymap('x','\\','',{noremap = true})
end

disable_vplugs()
leader_map()
vim.cmd[[runtime plugin/astronauta.vim]] -- load this now so that clicks clack
options:load_options()

vim.cmd[[filetype plugin indent on]]
if vim.fn.has('vim_starting') == 1 then
  vim.cmd[[syntax enable]]
end

require('domain.global')
require('poob.pfunc')
require('domain.keymaps')
aucmd.load_autocmds()
