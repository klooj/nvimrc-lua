vim.api.nvim_buf_set_keymap(0,'n','<leader>mP' ,':Prettier<CR>', {nowait = true, noremap = true})
vim.g['prettier#autoformat_require_pragma'] = 0
-- vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#exec_cmd_async'] = 1
vim.g['prettier#quickfix_auto_focus'] = 0
