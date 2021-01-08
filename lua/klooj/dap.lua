
local dap = require('dap')

-- dap.adapters.cpp = {
--   type = 'executable',
--   attach = {
--     pidProperty = "pid",
--     pidSelect = "ask"
--   },
--   command = 'lldb-vscode-11',
--   env = {
--     LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
--   },
--   name = "lldb"
-- }

dap.adapters.c = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode-11',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
  },
  name = "lldb"
}

dap.configurations.c = {
  {
    name = "Launch binary nvim",
    type = 'c',
    request = 'launch',
    program = './build/bin/nvim',
    args = {
      '--headless',
      '-c', 'echo getcompletion("vim.api.nvim_buf_", "lua")',
      '-c', 'qa!'
    },
    cwd = nil,
    environment = nil,
    externalConsole = true,
    MIMode = 'lldb',
  },
  {
    name = "Attach to nvim",
    type = 'c',
    request = 'attach',
    program = './build/bin/nvim',
    args = {
      '--headless',
      '-c', 'echo getcompletion("vim.api.nvim_buf_", "lua")',
      '-c', 'qa!'
    },
    cwd = nil,
    environment = nil,
    externalConsole = true,
    MIMode = 'lldb',
    -- }
  }
}

require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')


vim.cmd[[nnoremap <silent> <leader>D1r :lua require'dap'.repl.open()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1R :lua require'dap'.repl.run_last()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1l :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1b :lua require'dap'.toggle_breakpoint()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1c :lua require'dap'.continue()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1i :lua require'dap'.step_into()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1o :lua require'dap'.step_over()<CR>]]
vim.cmd[[nnoremap <silent> <leader>D1O :lua require'dap'.step_out()<CR>]]
