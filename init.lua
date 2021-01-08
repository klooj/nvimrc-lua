                                                                            --[[
For jumping to a lua file from within a lua file, use `<localleader>gf` the same way
you would `gf`; i.e. inside the parenthesis of require('some.file').
$FOONV/notes.md.
:
  1. tabnine isn't working properly
  2. snippets are just a pile rn
  3. be on lookout for formatting errors caused by the rampaging markdown linter
                                                                              ]]
local options = require('domain.options')
local aucmd = require('domain.autocommands')   -- TODO: consolidate and cleanup
local disable_distribution_plugins = function()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
end

local leader_map = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = '\\'
  vim.fn.nvim_set_keymap('n',' ','',{noremap = true})
  vim.fn.nvim_set_keymap('x',' ','',{noremap = true})
  vim.fn.nvim_set_keymap('n','\\','',{noremap = true})
  vim.fn.nvim_set_keymap('x','\\','',{noremap = true})
end


disable_distribution_plugins()
leader_map()
options:load_options()
require('domain.global')

vim.api.nvim_command('filetype plugin indent on')
if vim.fn.has('vim_starting') == 1 then
  vim.api.nvim_command('syntax enable')
end

require('domain.keymaps')
aucmd.load_autocmds()
