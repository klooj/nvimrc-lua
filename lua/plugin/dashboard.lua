local g = require('domain.global')
local nomap = vim.keymap.nnoremap
local l = [[<leader>]]
local vc = vim.cmd

local opts = {
  default_executive = 'fzf',
  session_directory = g.foonv .. 'sessions',
  custom_shortcut = {
    last_session = '<leader>asl',
    find_history = '<leader>flo',
    find_file = '<leader>fd',
    new_file = 'n/a',
    change_colorscheme = '<leader>fc',
    find_word = '<leader>fg',
    book_marks = '<leader>flm',
  },
  -- custom_shortcut_icon = {
    -- new_file = nil,
  -- },
}

VG('dashboard_', opts)

nomap{l .. 'ass', function() vc[[SessionSave]] end, {nowait = true}}
nomap{l .. 'asl', function() vc[[SessionLoad]] end, {nowait = true}}

  -- enable_session = '',
