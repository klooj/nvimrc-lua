require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    use_languagetree = true,
    -- disable = {"json"},
    custom_captures = {
      ['foo.bar'] = 'Identifier',
      ['function.call'] = 'LuaFunctionCall',
      ['function.bracket'] = 'Type',
    }
  },
  indent = {
    enable = true,
    -- disable = {'zsh'}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<M-[>',    -- maps in normal mode to init the node/scope selection
      node_incremental = '<M-[>',  -- increment to the upper named parent
      scope_incremental = '<M-{>', -- increment to the upper scope (as defined in locals.scm)
      node_decremental = '<M-]>',  -- decrement to the previous node
    },
  },
  rainbow = { -- parenthesis
    enable = true,
    -- disable = {'bash'}
  },
  context = {
    enable = true
  },
  refactor = {
    highlight_definitions = {enable = true},
    -- highlight_current_scope = {enable = true},
    smart_rename = {
      enable = true,
      keymaps = { -- mapping to rename reference under cursor
        smart_rename = '<leader>Tr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = '<leader>Td',
        goto_next_usage = '<leader>T]',
        goto_previous_usage = '<leader>T[',
        list_definitions = '<leader>Tl',
        list_definitions_toc = '<leader>Tc',
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["<leader>Tp"] = "@function.outer",
        ["<leader>TP"] = "@class.outer",
      },
    },
  },
  playground = {
    enable = false,
  },
  query_linter = {
    enable = false,
  },
}


----------

--[[
see :h nvim-treesitter-query-extensions

# i think i used this with playground
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.bash.used_by = "zsh"

]]
