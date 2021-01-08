-- local RELOAD = require('plenary.reload').reload_module
local global = require('domain.global')
local should_reload = true
local reloader = function()
  if should_reload then
    require('plenary.reload').reload_module('plenary')
    require('plenary.reload').reload_module('popup')
    require('plenary.reload').reload_module('telescope')
  end
end

reloader()

local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')
-- local finders = require('telescope.finders')
-- local pickers = require('telescope.pickers')

require('telescope').setup {

  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },

    scroll_strategy      = 'cycle',
    layout_strategy      = 'horizontal',
    selection_strategy   = 'reset',
    sorting_strategy     = "ascending",
    shorten_path         = true,

    -- A Sorter is called by the Picker on each item returned by the Finder to return a number, which is equivalent to
    -- the "distance" between the current prompt and the entry returned by a finder.

    generic_sorter       = sorters.get_generic_fuzzy_sorter,
    file_ignore_patterns = {"*.zwc*"},
    file_preview         = previewers.vim_buffer_cat.new,
    grep_previewer       = previewers.vim_buffer_vimgrep.new,
    qflist_previewer     = previewers.vim_buffer_qflist.new,
    color_devicons       = true,
    use_less             = false,
    set_env              = { ['COLORTERM'] = 'truecolor' },

    prompt_prefix        = ' 🌜 ',
    prompt_position      = "top",
    winblend             = 0,
    width                = 0.85,
    preview_cutoff       = 200,
    results_height       = 1,
    results_width        = 0.8,
    layout_defaults      = {
      horizontal = {
        width_padding  = 0.1,
        height_padding = 0.05,
        preview_width  = 0.6,
      },
      vertical   = {
        width_padding    = 0.05,
        height_padding   = 1,
        preview_height   = 0.7,
      }
    },

    border = {},
    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<esc>"] = actions.close,
        ["<C-]>"] = actions.move_selection_next,
        ["<C-[>"] = actions.move_selection_prev,
        ["<tab>"] = actions.add_selection,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
  file_sorter = sorters.get_fzy_sorter,
  file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
  grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
  qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  extensions = {
    fzy_native = { override_generic_sorter = false, override_file_sorter = true },
    --[[ fzf-writer adds 3 funcs out of the box: 1. require('telescope').extensions.fzf_writer.grep();
      2. require('telescope').extensions.fzf_writer.files(); 3. require('telescope').extensions.fzf_writer.staged_grep().
      re: #3, rg to filter exact matches then press ' | ' to switch to fzf]]
    fzf_writer = { use_highlighter = false, minimum_grep_characters  = 3, minimum_files_characters = 2 },
  }
}

if not global.is_pi then
  require('telescope').load_extension('fzy_native')
end
require('telescope').load_extension('gh')
require('telescope').load_extension('fzf_writer')

local M = {}

function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = "|> ::foonv:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim",
    width = .25,
    layout_strategy = 'horizontal',
  }
end

function M.edit_zsh()
  require('telescope.builtin').find_files {
    shorten_path = false,
    cwd = "~/.dotfiles/zdots",
    prompt = "|> ::zdots:: <| ",
    layout_strategy = 'horizontal',
  }
end

function M.edit_dots()
  require('telescope.builtin').find_files {
    shorten_path = false,
    cwd = "~/.dotfiles",
    prompt = "|> ::dotfiles:: <| ",
    layout_strategy = 'horizontal',
  }
end

function M.edit_klooj()
  require('telescope.builtin').find_files {
    prompt_title = "|> ::klooj:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/lua/klooj",
    width = .25,
    layout_strategy = 'horizontal',
  }
end

function M.nvim_runtime()
  require('telescope.builtin').find_files {
    prompt_title = "|> ::nvim runtime:: <|",
    shorten_path = false,
    cwd = "~/.local/share/nvim",
    width = .50,
    layout_strategy = 'horizontal',
  }
end

function M.edit_mywiki()
  require('telescope.builtin').find_files {
    prompt_title = "|> ::wiki:: <|",
    shorten_path = false,
    cwd = "~/Documents/wiki",
    width = .25,
    layout_strategy = 'horizontal',
  }
end

function M.edit_vplugs()
  require('telescope.builtin').find_files {
    prompt_title = "|> ::plugins.vim:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/plugin",
    width = .25,
    layout_strategy = 'horizontal',
  }
end

-- see builtin.fd.opts
function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin()
  require('telescope.builtin').builtin()
end

function M.git_files()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').git_files(opts)
end

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

function M.live_grep()
  require('telescope.builtin').live_grep {
    shorten_path = true
  }
end

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  }
end

function M.oldfiles()
  require('telescope.builtin').oldfiles { layout_strategy = 'vertical' }
end

function M.staged_search()
  require('telescope').extensions.fzf_writer.staged_grep()
end

function M.installed_plugins()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath('data') .. '/site/pack/packer/'
  }
end

function M.project_search()
  require('telescope.builtin').find_files {
    previewer = false,
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,

    -- layout_strategy = 'current_buffer',
  }
  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.search_all_files()
  require('telescope.builtin').find_files {
    find_command = { 'rga', '--no-ignore', '--files',},
  }
end

require('klooj.telescope.mappings')

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})


--[[ {{{ emojis
👓
🌙
🌚
🌘
🌗
🛸
🚀
🛰
🔭
💫
👽
}}}
]]
--[[ {{{ unsuccessful attempt to move modules to their own file
-- require('klooj.telescope.pickers')
-- return setmetatable({}, {
  --   __index = function(_, k)

    --     reloader()

    --     if M[k] then
    --       return ('klooj.telescope.pickers').M[k]
    --     else
    --       return require('telescope.builtin')[k]
    --     end
    --   end
    -- })


    -- return setup
    --[[
    require('telescope').load_extension('symbols')
    require('telescope').load_extension('dap')
    require('telescope').load_extension('vimspector')
    require('telescope').load_extension('packer')
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter    = true,
    },

    -- file_sorter          =
    -- sorters.fuzzy_with_index_bias

    if not Is_raspberry then
      local osFsort = sorters.get_fzy_sorter
      local osfzy = { override_generic_sorter = false, override_file_sorter = true }
    else
      local osFsort = sorters.get_fuzzy_file
      local osfzy = { override_generic_sorter = false, override_file_sorter = false }
    end
    -- sorters.get_fuzzy_file
    -- extensions.fzy_native = { override_generic_sorter = false, override_file_sorter = true }
    -- file_sorter = sorters.get_fzy_sorter

}}} ]]
