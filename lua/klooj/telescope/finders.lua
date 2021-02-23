local finders = {}

local drop_list = require('telescope.themes').get_dropdown {
  results_height = 20,
  winblend = 20,
  width = 0.45,
  previewer = false,
}

function finders:edit_neovim()
  require('telescope.builtin').fd {
    prompt_title = "|> ::foonv:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function finders:edit_zsh()
  require('telescope.builtin').fd {
    shorten_path = false,
    cwd = "~/.dotfiles/zdots",
    prompt = "|> ::zdots:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function finders:edit_dots()
  require('telescope.builtin').fd {
    shorten_path = false,
    cwd = "~/.dotfiles",
    prompt = "|> ::dotfiles:: <| ",
    -- layout_strategy = 'horizontal',
  }
end

function finders:edit_klooj()
  require('telescope.builtin').fd {
    prompt_title = "|> ::klooj:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/lua/klooj",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function finders:edit_ploog()
  require('telescope.builtin').fd {
    prompt_title = "|> ::klooj:: <|",
    shorten_path = false,
    cwd = "~/.config/nvim/lua/klooj",
    width = .25,
    -- layout_strategy = 'horizontal',
  }
end

function finders:nvim_runtime()
  require('telescope.builtin').fd {
    prompt_title = "|> ::nvim runtime:: <|",
    shorten_path = false,
    cwd = "~/.local/share/nvim",
    width = .50,
    -- layout_strategy = 'horizontal',
  }
end

function finders:rgfz_wiki()
  require('telescope').extensions.fzf_writer.staged_grep {
    prompt_title = "|> rg|fz: wiki ->",
    shorten_path = true,
    cwd = "~/Desktop/info",
    width = .70,
    layout_strategy = 'horizontal',
  }
end

function finders:frecy_wiki()
  require('telescope').extensions.frecency.frecency {
    prompt_title = "|> frecy-wiki ++",
    cwd = "~/Desktop/info",
    theme = drop_list
  }
end

function finders:fd_wiki()
  require('telescope.builtin').fd {
    prompt_title = "<> fd wiki <>",
    cwd = "~/Desktop/info",
    theme = drop_list
  }
end

function finders:fd_home()
  require('telescope.builtin').fd {
    prompt_title = "♾️  HOME ♾️ ",
    cwd = "~/",
    theme = drop_list
  }
end

-- see builtin.fd.opts
function finders:fd()
  require('telescope.builtin').fd()
end

function finders:builtin()
  require('telescope.builtin').builtin(drop_list)
end

function finders:buf_fuzzy()
  require('telescope.builtin').current_buffer_fuzzy_find(drop_list)
end

function finders:git_files()
  require('telescope.builtin').git_files(drop_list)
end

function finders:lsp_code_actions()
  require('telescope.builtin').lsp_code_actions(drop_list)
end

function finders:live_grep()
  require('telescope.builtin').live_grep {
    shorten_path = true
  }
end

function finders:grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  }
end

function finders:oldfiles()
  if pcall(require('telescope').load_extension, 'frecency') then
    require('telescope').extensions.frecency.frecency()
  else
    require('telescope.builtin').oldfiles { layout_strategy = 'vertical' }
  end
end

function finders:staged_search()
  require('telescope').extensions.fzf_writer.staged_grep()
end

function finders:installed_plugins()
  require('telescope.builtin').fd {
    cwd = vim.fn.stdpath('data') .. '/site/pack/packer/'
  }
end

function finders:project_search()
  require('telescope.builtin').fd {
    layout_strategy = "vertical",
    cwd = require('nvim_lsp.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function finders:buffers()
  require('telescope.builtin').buffers {
    shorten_path = false,
  }
end

function finders:help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function finders:search_all_files()
  require('telescope.builtin').find_files {
    find_command = {
      'rga',
      '--no-ignore',
      '--files'
    }
  }
end

return finders
