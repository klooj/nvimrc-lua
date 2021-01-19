--[[
In lua files,  use `<localleader>gf` like `gf`
TODO:
  1. tabnine isn't working properly
  2. snippets barely half done
                                                                              ]]
local options = require('domain.options')
local aucmd = require('domain.autocommands')

local vg = vim.g
function VG(name,opts)
  for k,v in pairs(opts) do
    vg[name .. k] = v
  end
end


local disable_distribution_plugins = function()
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


disable_distribution_plugins()
leader_map()
options:load_options()

vim.api.nvim_command('filetype plugin indent on')
if vim.fn.has('vim_starting') == 1 then
  vim.api.nvim_command('syntax enable')
end

require('domain.keymaps')
aucmd.load_autocmds()


----------------------------
  -- VG {
  --   loaded_gzip              = 1,
  --   loaded_tar               = 1,
  --   loaded_tarPlugin         = 1,
  --   loaded_zip               = 1,
  --   loaded_zipPlugin         = 1,
  --   loaded_getscript         = 1,
  --   loaded_getscriptPlugin   = 1,
  --   loaded_vimball           = 1,
  --   loaded_vimballPlugin     = 1,
  --   loaded_matchit           = 1,
  --   loaded_matchparen        = 1,
  --   loaded_2html_plugin      = 1,
  --   loaded_logiPat           = 1,
  --   loaded_rrhelper          = 1,
  --   loaded_netrw             = 1,
  --   loaded_netrwPlugin       = 1,
  --   loaded_netrwSettings     = 1,
  --   loaded_netrwFileHandlers = 1,
  -- }
-- end
