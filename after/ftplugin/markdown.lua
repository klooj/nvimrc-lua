-- these almost work 100% without affecting other maps, except unindent and normal mkdx-o
vim.api.nvim_buf_set_keymap(0,'i','<M-CR>'     ,'<C-R>=mkdx#EnterHandler()<Cr>'       ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'i','<M-S-CR>'   ,'<C-R>=mkdx#ShiftEnterHandler()<Cr>'  ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'i','<M-S-Tab>'  ,'<C-O>:call mkdx#IndentHandler(0)<Cr>',{nowait = true})
vim.api.nvim_buf_set_keymap(0,'i','<M-Tab>'    ,'<C-O>:call mkdx#IndentHandler(1)<Cr>',{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'n','<M-CR>'     ,':<C-U>call mkdx#OHandler()<Cr>'      ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'n','<M-S-CR>'   ,':<C-U>call mkdx#ShiftOHandler()<Cr>' ,{nowait = true  ,noremap = true})

vim.api.nvim_buf_set_keymap(0,'n','<leader>mpo',':MarkedOpen!<Cr>'                    ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'n','<leader>mpq',':MarkedQuit<Cr>'                     ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'n','<leader>mpt',':MarkedToggle<Cr>'                   ,{nowait = true  ,noremap = true})
vim.api.nvim_buf_set_keymap(0,'n','<leader>mx' ,'<Plug>(mkdx-checkbox-next-n)'        ,{nowait = true})

vim.api.nvim_buf_set_keymap(0,'v','<leader>mx' ,'<Plug>(mkdx-checkbox-next-v)'        ,{nowait = true})

-----------
-- vim.g.which_key_map = {
--   ['m'] = {
--     ['-'] = 'checkbox previous'     ,
--     ['='] = 'checkbox next'         ,
--     [','] = 'CSV to table'          ,
--     ['/'] = 'italicize'             ,
--     ['`'] = 'wrap with inline code' ,
--     ['\''] = 'toggle quote'         ,
--     ['['] = 'promote header'        ,
--     [']'] = 'demote header'         ,
--     ['b'] = 'bold'                      ,
--     ['i'] = 'generate/update TOC'       ,
--     ['I'] = 'quickfix TOC'              ,
--     ['j'] = 'jump to header'            ,
--     ['k'] = 'toggle kbd shortcut'       ,
--     ['L'] = 'quickfix deadlinks'        ,
--     ['t'] = 'toggle checkBOX'           ,
--     ['lt'] = 'toggle checkLIST'         ,
--     ['ll'] = 'toggle list'              ,
--     ['ln'] = 'wrap link'                ,
--     ['O'] = 'Obsidian'                  ,
--     ['s'] = 'strikethrough'             ,
--     ['p'] = {
--       ['name'] = '+preview'         ,
--       ['o'] = 'open'                    ,
--       ['q'] = 'quit'                    ,
--       ['t'] = 'toggle'                  ,
--     },
--   }
-- }

-- vim.cmd[[call which_key#register('\\', "g:which_key_map")]]

-- :call mkdx#IndentHandler(1)<Cr>` -- indent
-- :call mkdx#IndentHandler(0)<Cr>` -- unindent
-- vim.api.nvim_buf_set_var(0, 'md_key_map', {
-- <Plug>(mkdx-unindent)
-- <Plug>(mkdx-indent)
-- User vim-which-key call which_key#register('\\', 'b:md_key_map')
