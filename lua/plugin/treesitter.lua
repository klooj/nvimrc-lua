-- mapping of user defined captures to highlight groups
-- local custom_captures = {
  -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
  -- ['foo.bar'] = 'Identifier',
  -- ['TODO'] = 'error',
  -- ['function.call'] = 'LuaFunctionCall',
  -- ['function.bracket'] = 'Type',
-- }

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
-- parser_config.bash.used_by = "zsh"

require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  highlight = {
    enable = true,
    use_languagetree = true,
    -- disable = {"json"},
    -- custom_captures = custom_captures,
  },
  indent = {
    enable = true
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
  -- rainbow parenthesis
  rainbow = {
    enable = true,
    -- disable = {'bash'}
  },
  context = {
    enable = true
  },
  refactor = {
    highlight_definitions = {enable = true},
    smart_rename = { -- highlight_current_scope = {enable = true},
      enable = true,
      keymaps = { -- mapping to rename reference under cursor
        smart_rename = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gtd', -- mapping to go to definition of symbol under cursor
        list_definitions = 'gtD', -- mapping to list all definitions in current file
      },
    },
  },
  -- syntax-aware textobjects
  textobjects = {
    enable = true,
    -- disable = {},
    keymaps = {
      -- you can define your own textobjects directly here
      ['iL'] = {
        python = '(function_definition) @function',
        -- cpp = '(function_definition) @function',
        -- c = '(function_definition) @function',
        -- java = '(method_declaration) @function',
      },
      --     -- or you use the queries from supported languages with textobjects.scm
      ['aC'] = '@class.outer',
      ['ac'] = '@conditional.outer',
      ['ad'] = '@comment.outer',
      ['ae'] = '@block.outer',
      ['af'] = '@function.outer',
      ['al'] = '@loop.outer',
      ['am'] = '@call.outer',
      ['as'] = '@statement.outer',
      ['iC'] = '@class.inner',
      ['ic'] = '@conditional.inner',
      ['ie'] = '@block.inner',
      ['if'] = '@function.inner',
      ['il'] = '@loop.inner',
      ['im'] = '@call.inner',
      ['is'] = '@statement.inner',
    },
  },
  playground = {
    enable = false,
  },
  query_linter = {
    enable = false,
  },
}
