-- COMPE
-- vim.g.loaded_compe_treesitter = true
vim.g.loaded_compe_snippets_nvim = true
-- vim.g.loaded_compe_spell = true
-- vim.g.loaded_compe_tags = true
-- vim.g.loaded_compe_ultisnips = true
vim.g.loaded_compe_vim_lsc = true
vim.g.loaded_compe_vim_lsp = true
vim.g.loaded_compe_nvim_lua = true

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = 'always',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    -- vsnip = true,
    nvim_lsp = true,
    -- nvim_lua = true,
    spell = true,
    tags = true,
    ultisnips = true,
    -- snippets_nvim = true,
    -- tabnine = true,
    treesitter = true,
    zsh = true,
  },
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})



-- local global = require('domain.global')
-- -- require("klooj.snippets")

-- -- COMPLETION NVIM
-- local opts = {
--   abbr_length = 30,
--   auto_change_source = 1,
--   disable_filetypes = {'TelescopePrompt'},
--   enable_auto_hover = 1,
--   enable_auto_paren = 1,
--   enable_auto_popup = 1,
--   enable_snippet = 'UltiSnips',
--   -- enable_snippet = 'vim-vsnip',
--   -- enable_snippet = 'snippets.nvim',
--   -- matching_ignore_case = 1,
--   matching_smart_case = 1,
--   matching_strategy_list = {'exact'},
--   -- menu_length = 0,
--   tabnine_max_lines = 1000,
--   tabnine_max_num_results = 3,
--   tabnine_priority = 10,
--   tabnine_sort_by_details = 1,
--   tabnine_tabnine_path = global.home .. '/.local/share/t9/3.2.28/TabNine',
--   -- trigger_keyword_length = 2,
--   trigger_on_delete = 0,
--   sorting = 'length',
--   chain_complete_list = {
--     default = {
--       default = {
--         { complete_items = {'lsp'}},
--         { complete_items = {'path', 'tabnine', 'snippet'}},
--         { mode = '<c-p>'},
--         { mode = '<c-n>'}
--       },
--       comment = {
--         { complete_items = {'path', 'tabnine'}},
--       },
--     },
--     markdown = {
--       { complete_items = {'path', 'tabnine', 'snippet'}},
--       { mode = '<c-p>'},
--       { mode = '<c-n>'}
--     }
--   },
-- }

-- VG("completion_", opts)

-- if not vim.g.loaded_completion_tabnine then
  -- vim.cmd [[ packadd completion-nvim completion-tabnine ]]
-- end

    -- default = {
    --   { complete_items = {'lsp', 'tabnine', 'path', 'snippet'}},
    --   { mode = '<c-p>'},
    --   { mode = '<c-n>'},
    -- },
