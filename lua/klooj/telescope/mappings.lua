

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

map_tele('<leader>ar', 'reloader')

map_tele('<leader>f/', 'buf_fuzzy')
-- f; anyjump
map_tele('<leader>fa', 'autocommands')
map_tele('<leader>fA', 'search_all_files')
map_tele('<leader>fb', 'buffers')
map_tele('<leader>fB', 'builtin')
map_tele('<leader>fc', 'colorscheme')
map_tele('<leader>fd', 'fd')
-- ff, fz staged
map_tele('<leader>fg', 'live_grep')
-- |>G for git
map_tele('<leader>fGg', 'git_files')
map_tele('<leader>fGb', 'git_branches')
map_tele('<leader>fGc', 'git_bcommits')
map_tele('<leader>fGC', 'git_commits')
map_tele('<leader>fGs', 'git_status')
--
map_tele('<leader>fh', 'command_history')
map_tele('<leader>fH', 'help_tags')
-- |>i for 'in foo/'
map_tele('<leader>fid', 'edit_dots')
map_tele('<leader>fik', 'edit_klooj')
map_tele('<leader>fin', 'edit_neovim')
map_tele('<leader>fip', 'installed_plugins')
map_tele('<leader>fiv', 'nvim_runtime')
map_tele('<leader>fiw', 'search_wiki')
map_tele('<leader>fiz', 'edit_zsh')
-- |>l for list
map_tele('<leader>flh', 'highlights')
map_tele('<leader>flk', 'keymaps')
map_tele('<leader>flm', 'marks')
map_tele('<leader>flo', 'oldfiles')
map_tele('<leader>flr', 'registers')
map_tele('<leader>flt', 'current_buffer_tags')
map_tele('<leader>flv', 'vim_options')
-- |>L for LSP
map_tele('<leader>fLa', 'lsp_code_actions')
map_tele('<leader>fLA', 'lsp_range_code_actions')
map_tele('<leader>fLr', 'lsp_references')
map_tele('<leader>fLd', 'lsp_document_symbols')
map_tele('<leader>fLw', 'lsp_workspace_symbols')
--
map_tele('<leader>fp', 'project_search')
map_tele('<leader>fq', 'quickfix')
-- R  grepper_replace?
-- r frecency
map_tele('<leader>ft', 'treesitter')
map_tele('<leader>fT', 'tags')
map_tele('<leader>fw', 'grep_string', { short_path = true, word_match = '-w' })
-- fz : fzf file
-- fz : fzf grep



return map_tele

----------
-- map_tele('<leader>fip', 'edit_vplugs')
-- \ 'W' : 'grepper_word'        ,
