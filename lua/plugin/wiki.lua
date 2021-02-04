local glob = require('domain.global')
vim.g.wiki_root = glob.home .. 'Desktop/info'
vim.g.wiki_filetypes = {'wiki', 'markdown', 'md'}
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_cache_persistent = true
vim.g.wiki_list_todos = {'TODO', 'FollowUp', 'done'}
vim.g.wiki_mappings_use_defaults = 'none'
vim.g.wiki_tags_scan_num_lines = 'all'
vim.g.wiki_export = {
 args = '',
 from_format = 'markdown',
 ext = 'html',
 link_ext_replace = true,
 view = false,
 output = vim.g.wiki_root
}

-- make a keymap for the func below to trigger completion for wiki tags/files
-- local mapper = function(mode, key, result)
--   vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
-- end

local M = {}

function M.getCompletionItems(prefix)
  local items = {}
  if vim.fn.exists('g:wiki_loaded') == 1 then
    items = vim.api.nvim_call_function('wiki#complete#omnicomplete', {0, prefix})
  end

  return items
end

M.complete_item = {item = M.getCompletionItems}

return M
