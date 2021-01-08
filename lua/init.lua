local global = require('domain.global')
-- local ok, msg = pcall(function() require('klooj.lsp_config') end)
-- if not ok then
  -- print(msg)
-- end
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

-- require('klooj.lsp_config')

vim.g.completion_auto_change_source = 1
vim.g.completion_disable_filetypes = {'TelescopePrompt'}
vim.g.completion_enable_auto_hover = 1
vim.g.completion_enable_auto_paren = 1
vim.g.completion_enable_auto_popup = 1
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_matching_ignore_case = 1
vim.g.completion_matching_strategy_list = {'exact'}
vim.g.completion_tabnine_max_lines = 1000
vim.g.completion_tabnine_max_num_results = 3
vim.g.completion_tabnine_priority = 1
vim.g.completion_tabnine_sort_by_details = 1
vim.g.completion_tabnine_tabnine_path = global.home .. '/.local/share/t9/3.2.28/TabNine'
vim.g.completion_trigger_keyword_length = 2
-- === theme ===
if os.getenv("TRANSPARENT_TERM") then
  vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  vim.cmd[[hi CursorLine guibg=#13111a ]]
  -- vim.cmd[[hi LineNr ctermbg=NONE guibg=NONE]]

else
  -- vim.g.modus_faint_syntax = 1
  -- vim.cmd[[packadd modus-theme-vim]]; require('colorbuddy').colorscheme('modus-vivendi')

  -- vim.cmd[[packadd zephyr-nvim]]

  -- vim.cmd[[ packadd doom-one.vim ]]
  -- vim.cmd[[ ColorScheme doom-one ]]

  vim.cmd[[ packadd nvcode-color-schemes.vim ]]
  vim.cmd[[colorscheme snazzy]]
end


vim.cmd[[hi! link colorcolumn cursorline]]
vim.cmd[[hi! link cursorcolumn cursorline]]


vim.cmd[[call which_key#register('<Space>', "g:which_key_map")]]
vim.cmd[[call which_key#register(',', "g:lo_key_map")]]
-- vim.cmd[[hi! extTodo ctermfg=#BB4422 gui=bold guifg=#BB4422]]
-- vim.cmd[[hi! extTodo ctermfg=red gui=bold guifg=red]]
