-- from tjdevries

-- this needs updating for different repls, i think
package.loaded['klooj.repl'] = nil

local M = {}

M.repl_id = nil

-- buffers to corresponding repls
M.repl_map = {}

function M.create_repl()
  if not M.repl_id then
    vim.cmd [[20new]]
    M.repl_id = vim.fn.termopen("python")

    vim.wait(100, function() return false end)
  end
end

function M.send_repl_line()
  M.create_repl()

  vim.fn.chansend(M.repl_id, vim.fn.getline('.') .. "\n")
end

-- TODO: Remember how to actually do this...
function M.send_repl_selection()
  M.create_repl()

  local pos1 = vim.fn.getpos("'[")
  local pos2 = vim.fn.getpos("']")

  print(vim.inspect(pos1), vim.inspect(pos2))
end


vim.cmd [[nnoremap <leader>DL :call luaeval("require('klooj.repl').send_repl_line()")<CR>]]
vim.cmd [[vnoremap <leader>DS :call luaeval("require('klooj.repl').send_repl_selection()")<CR>]]

return M
