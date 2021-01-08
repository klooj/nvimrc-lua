-- vim.g.wiki_root = '$HOME/Documents/wiki'
-- vim.g.wiki_cache_persistent = true

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
