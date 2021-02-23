local M = {}

local drop_list = require('telescope.themes').get_dropdown {
  results_height = 20,
  winblend = 20,
  width = 0.45,
  previewer = false,
}

function M.edit_neovim()
  require('telescope.builtin').fd {
    prompt_title = "|> ::foonv:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_zsh()
  require('telescope.builtin').fd {
    shorten_path = false,
    cwd = "~/.dotfiles/zdots",
    prompt = "|> ::zdots:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_dots()
  require('telescope.builtin').fd {
    shorten_path = false,
    cwd = "~/.dotfiles",
    prompt = "|> ::dotfiles:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_klooj()
  require('telescope.builtin').fd {
    prompt_title = "|> ::klooj:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/lua/klooj",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function M.edit_ploog()
  require('telescope.builtin').fd {
    prompt_title = "|> ::klooj:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/lua/klooj",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function M.nvim_runtime()
  require('telescope.builtin').fd {
    prompt_title = "|> ::nvim runtime:: <|",
    shorten_path = false,
    cwd = "~/.local/share/nvim",
    width = .50,
    -- layout_strategy = 'horizontal',
  }
end

function M.rgfz_wiki()
  require('telescope').extensions.fzf_writer.staged_grep {
    prompt_title = "|> rg|fz: wiki ->",
    shorten_path = true,
    cwd = "~/Desktop/info",
    width = .70,
    layout_strategy = 'horizontal',
  }
end

function M.frecy_wiki()
  require('telescope').extensions.frecency.frecency {
    prompt_title = "|> frecy-wiki ++",
    cwd = "~/Desktop/info",
    theme = drop_list
  }
end

function M.fd_wiki()
  require('telescope.builtin').fd {
    prompt_title = "<> fd wiki <>",
    cwd = "~/Desktop/info",
    theme = drop_list
  }
end

function M.fd_home()
  require('telescope.builtin').fd {
    prompt_title = "♾️  HOME ♾️ ",
    cwd = "~/",
    theme = drop_list
  }
end

-- see builtin.fd.opts
function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin()
  require('telescope.builtin').builtin(drop_list)
end

function M.buf_fuzzy()
  require('telescope.builtin').current_buffer_fuzzy_find(drop_list)
end

function M.git_files()
  require('telescope.builtin').git_files(drop_list)
end

function M.lsp_code_actions()
  require('telescope.builtin').lsp_code_actions(drop_list)
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
  if pcall(require('telescope').load_extension, 'frecency') then
    require('telescope').extensions.frecency.frecency()
  else
    require('telescope.builtin').oldfiles { layout_strategy = 'vertical' }
  end
end

function M.staged_search()
  require('telescope').extensions.fzf_writer.staged_grep()
end

function M.installed_plugins()
  require('telescope.builtin').fd {
    cwd = vim.fn.stdpath('data') .. '/site/pack/packer/'
  }
end

function M.project_search()
  require('telescope.builtin').fd {
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.search_all_files()
  require('telescope.builtin').find_files {
    find_command = {
      'rga',
      '--no-ignore',
      '--files'
    }
  }
end

return M
