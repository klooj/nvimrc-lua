local global = require('domain.global')
-- require("klooj.snippets")

-- COMPLETION NVIM
local opts = {
  abbr_length = 30,
  auto_change_source = 1,
  disable_filetypes = {'TelescopePrompt'},
  enable_auto_hover = 1,
  enable_auto_paren = 1,
  enable_auto_popup = 1,
  enable_snippet = 'UltiSnips',
  -- enable_snippet = 'vim-vsnip',
  -- enable_snippet = 'snippets.nvim',
  -- matching_ignore_case = 1,
  matching_smart_case = 1,
  matching_strategy_list = {'exact'},
  -- menu_length = 0,
  tabnine_max_lines = 1000,
  tabnine_max_num_results = 3,
  tabnine_priority = 10,
  tabnine_sort_by_details = 1,
  tabnine_tabnine_path = global.home .. '/.local/share/t9/3.2.28/TabNine',
  -- trigger_keyword_length = 2,
  trigger_on_delete = 0,
  sorting = 'length',
  chain_complete_list = {
    default = {
      default = {
        { complete_items = {'lsp'}},
        { complete_items = {'path', 'tabnine', 'snippet'}},
        { mode = '<c-p>'},
        { mode = '<c-n>'}
      },
      comment = {
        { complete_items = {'path', 'tabnine'}},
      },
    },
    markdown = {
      { complete_items = {'path', 'tabnine', 'snippet'}},
      { mode = '<c-p>'},
      { mode = '<c-n>'}
    }
  },
}

VG("completion_", opts)

if not vim.g.loaded_completion_tabnine then
  vim.cmd [[ packadd completion-nvim completion-tabnine ]]
end

    -- default = {
    --   { complete_items = {'lsp', 'tabnine', 'path', 'snippet'}},
    --   { mode = '<c-p>'},
    --   { mode = '<c-n>'},
    -- },

-- COMPE
-- require('compe').setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 2;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = true;

--   source = {
--     path = true;
--     buffer = true;
--     calc = true;
--     vsnip = true;
--     nvim_lsp = true;
--     nvim_lua = true;
--     spell = true;
--     -- tags = true;
--     -- snippets_nvim = true;
--     -- tabnine = true;
--     treesitter = true;
--     zsh = true;
--   };
-- }
