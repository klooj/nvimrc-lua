require('publibs.pfunc')

-- === theme ===
if os.getenv("TRANSPARENT_TERM") then
  vim.cmd[[colorscheme gruvbox]]
  vim.cmd[[hi! Normal guibg=NONE ctermbg=NONE]]
  vim.cmd[[hi! CursorLine guibg=#080656 ]]
  -- vim.cmd[[hi LineNr ctermbg=NONE guibg=NONE]]
end

vim.cmd[[hi! link colorcolumn cursorline]]
vim.cmd[[hi! link cursorcolumn cursorline]]
-- vim.cmd[[hi! LineNr guifg=#BB4422 ]]
vim.cmd[[hi LineNr guifg=#822000]]

vim.cmd[[call which_key#register('<Space>', "g:which_key_map")]]
vim.cmd[[call which_key#register('\\', "g:lo_key_map")]]

--------------------
-- local ok, msg = pcall(function() require('klooj.lsp_config') end)
-- if not ok then
  -- print(msg)
-- end


-- vim.cmd[[hi! extTodo ctermfg=#BB4422 gui=bold guifg=#BB4422]]
-- vim.cmd[[hi! extTodo ctermfg=red gui=bold guifg=red]]
