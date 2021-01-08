

local map_tele = function(key, f, options, buffer)
  local mode = "n"
  local rhs = string.format(
    "<cmd>lua R('klooj.telescope')['%s'](%s)<CR>",
    f,
    options and vim.inspect(options, { newline = '' }) or ''
  )
  local options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, options)
  end
end

vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<Plug>(TelescopeFuzzyCommandSearch)', { noremap = false, nowait = true })

-----------

-- map_tele('<leader>Da', 'lsp_code_action')

map_tele('<leader>f/', 'current_buffer_fuzzy_find')
map_tele('<leader>f!', 'command_history')
map_tele('<leader>fa', 'autocommands')
map_tele('<leader>fA', 'search_all_files')
map_tele('<leader>fb', 'buffers')
map_tele('<leader>fB', 'builtin')
map_tele('<leader>fc', 'colorscheme')
map_tele('<leader>fd', 'fd')
map_tele('<leader>ff', 'find_files')
-- \ 'F' : [':NvimTreeFindFile'   , 'find file lua tree'] ,
map_tele('<leader>fG', 'grep_prompt')
map_tele('<leader>fg', 'live_grep')
map_tele('<leader>fh', 'help_tags')
map_tele('<leader>fk', 'keymaps')
-- group l is below
map_tele('<leader>fL', 'project_search')
map_tele('<leader>fm', 'marks')
map_tele('<leader>fn', 'nvim_runtime')
map_tele('<leader>fp', 'installed_plugins')
map_tele('<leader>fq', 'quickfix')
-- \ 'R' : 'grepper_replace'     ,
map_tele('<leader>fr', 'reloader')
map_tele('<leader>fs', 'staged_search')
map_tele('<leader>ft', 'current_buffer_tags')
map_tele('<leader>fT', 'tags')
map_tele('<leader>fv', 'vim_options')
map_tele('<leader>fw', 'grep_string', { short_path = true, word_match = '-w' })
-- \ 'W' : 'grepper_word'        ,

map_tele('<leader>fld', 'edit_dots')
map_tele('<leader>flg', 'git_files')
-- \ 'h' : [':History'           , 'file history'],
map_tele('<leader>flk', 'edit_klooj')
map_tele('<leader>fln', 'edit_neovim')
map_tele('<leader>flo', 'oldfiles')
map_tele('<leader>flp', 'edit_vplugs')
map_tele('<leader>flr', 'registers')
map_tele('<leader>flt', 'treesitter')
map_tele('<leader>flw', 'edit_mywiki')
map_tele('<leader>flz', 'edit_zsh')

return map_tele
