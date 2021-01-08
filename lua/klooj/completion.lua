local global = require('domain.global')
-- local M = {}

-- function M.infer()
if not vim.g.loaded_completion_tabnine then
  vim.cmd [[ packadd completion-nvim completion-tabnine ]]
end

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
vim.g.completion_tabnine_priority = 2
vim.g.completion_tabnine_sort_by_details = 1
vim.g.completion_tabnine_tabnine_path = global.home .. '/.local/share/t9/3.2.28/TabNine'
vim.g.completion_trigger_keyword_length = 2

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'tabnine', 'snippet', 'lsp' }},
    { mode = '<c-p>'},
    { mode = '<c-n>'}
  }
}
-- end

-- function M.imply()
  -- M.infer()
  -- require('completion').on_attach()
-- end

    -- default = {
    -- string = { { complete_items = { 'path', 'tabnine' }} }}}
    --[[_____________
    | @tjdevries |
    -------------]]
-- function M.matchLine()
--   local current_line = vim.api.nvim_get_current_line()
--   current_line = vim.trim(current_line)

--   if not current_line then
--     print("You aren't on a line or something weird")
--     return
--   end

--   local all_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

--   local matching_lines = {}
--   for _, v in ipairs(all_lines) do
--     if string.find(v, current_line, 1, 1) then
--       table.insert(matching_lines, v)
--     end
--   end

--   vim.fn.complete(1, matching_lines)
--   return ''
-- end

-- vim.cmd [[inoremap <silent><c-x><c-m> <c-R>=v:lua.klooj.completion.matchLine()<CR>]]

-- return setmetatable({}, {
--   __index = function(_, k)
--     -- reloader()

--     if M[k] then
--       return M[k]
--     else
--       return require('klooj.completion')[k]
--     end
--   end
-- })
-- return comp
-- ['complete_items'] = },
-- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
