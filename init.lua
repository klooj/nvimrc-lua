-- if the lsp attaches, use `<CR>` as you would `gf` * this just stopped working out of nowhere!
local options = require('domain.options')
local aucmd = require('domain.autocommands')
local vg = vim.g
function VG(name, opts)
  for k, v in pairs(opts) do
    vg[name .. k] = v
  end
end

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
options:load_options()

vim.cmd[[filetype plugin indent on]]
if vim.fn.has('vim_starting') == 1 then
  vim.cmd[[syntax enable]]
end

require('domain.global')
require('poob.pfunc')
require('domain.keymaps')
aucmd.load_autocmds()

--------------
