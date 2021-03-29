-- vim.keymap.nnoremap{'<CR>', require('find_require').find_require(), {nowait = true, buffer = true}}

  -- nrmap{'<CR>'   , vim.lsp.buf.definition, buffer = 0}
  -- require('find_require').find_require()<CR>
  -- gf <cmd>:lua require('find_require').find_require()<CR>
  -- nrmap{'<CR>'   , function() vim.lsp.buf.definition() end                                , {nowait = true, buffer = true}}
  -- nrmap{'gh'     , function() require("lspsaga.provider").lsp_finder() end                , {nowait = true, buffer = true}}
