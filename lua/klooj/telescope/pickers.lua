-- this doesn't work. it was an attempt to make telescope more modular

local should_reload = true
local reloader = function()
  if should_reload then
    R('plenary')
    R('popup')
    R('telescope')
  end
end

--[[
require('klooj.telescope')
local actions = require('telescope.actions')
local themes = require('telescope.themes')
]]

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

}}} ]]
