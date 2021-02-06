local glob = require('domain.global')
local opts = {
	cache_persistent = true,
	cache_root = glob.home .. '.cache/wiki.vim/',
	export = {
		args = '',
		ext = 'html',
		from_format = 'markdown',
		link_ext_replace = true,
		output = vim.g.wiki_root,
		view = false,
	},
	filetypes = {'wiki', 'markdown', 'md'},
	link_extension = '.md',
	link_target_type = 'md',
	list_todos = {'TODO', 'followUp', 'DONE'},
	mappings_use_defaults = 'none',
	root = glob.home .. 'Desktop/info',
	tags_scan_num_lines = 'all',
}

VG("wiki_", opts)
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
