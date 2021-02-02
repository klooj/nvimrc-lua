local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local xnoremap = vim.keymap.xnoremap

nnoremap{'<localleader>x' , function() vim.cmd[[ToggleCheckbox]] end, {nowait = true, buffer = true}}
inoremap{ '<M-CR>', function() vim.cmd[[InsertNewBullet]] end, {nowait = true, buffer = true}}

nnoremap{'<leader>mpo' , function() vim.cmd[[MarkedOpen!]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mpq' , function() vim.cmd[[MarkedQuit]]  end,{nowait = true, buffer = true}}
nnoremap{'<leader>mpt' , function() vim.cmd[[MarkedToggle]]end,{nowait = true, buffer = true}}
nnoremap{'<leader>mP'  , function() vim.cmd[[Prettier]]    end,{nowait = true, buffer = true}}

nnoremap{'<leader>mhd' , function() vim.cmd[[HeaderDecrease]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mhi' , function() vim.cmd[[HeaderIncrease]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mha' , function() vim.cmd[[SetexToAtx]] end,{nowait = true, buffer = true}}
xnoremap{'<leader>mha' , function() vim.cmd[[SetexToAtx]] end,{nowait = true, buffer = true}}

nnoremap{'<leader>mt'  , function() vim.cmd[[TableFormat]] end,{nowait = true, buffer = true}}
xnoremap{'<leader>mt'  , function() vim.cmd[[TableFormat]] end,{nowait = true, buffer = true}}

nnoremap{'<leader>mfP'  , function() vim.cmd[[g/^/norm gqq]] end,{nowait = true, buffer = true}}

nnoremap{'<leader>mcc' , function() vim.cmd[[WikiPageToc]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mch' , function() vim.cmd[[Toch]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mct' , function() vim.cmd[[Toct]] end,{nowait = true, buffer = true}}
nnoremap{'<leader>mcv' , function() vim.cmd[[Tocv]] end,{nowait = true, buffer = true}}


vim.g['prettier#autoformat_require_pragma'] = 0
-- vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#exec_cmd_async'] = 1
vim.g['prettier#quickfix_auto_focus'] = 0


-----------
-- these almost work 100% without affecting other maps, except unindent and normal mkdx-o
-- vim.api.nvim_buf_set_keymap(0,'i','<M-S-CR>'   ,'<C-R>=mkdx#ShiftEnterHandler()<Cr>'  ,{nowait = true  ,noremap = true})
-- vim.api.nvim_buf_set_keymap(0,'i','<M-S-Tab>'  ,'<C-O>:call mkdx#IndentHandler(0)<Cr>',{nowait = true})
-- vim.api.nvim_buf_set_keymap(0,'i','<M-Tab>'    ,'<C-O>:call mkdx#IndentHandler(1)<Cr>',{nowait = true  ,noremap = true})
-- vim.api.nvim_buf_set_keymap(0,'n','<M-CR>'     ,':<C-U>call mkdx#OHandler()<Cr>'      ,{nowait = true  ,noremap = true})
-- vim.api.nvim_buf_set_keymap(0,'n','<M-S-CR>'   ,':<C-U>call mkdx#ShiftOHandler()<Cr>' ,{nowait = true  ,noremap = true})
-- vim.api.nvim_buf_set_keymap(0,'n','<leader>mx' ,'<Plug>(mkdx-checkbox-next-n)'        ,{nowait = true})
-- vim.api.nvim_buf_set_keymap(0,'v','<leader>mx' ,'<Plug>(mkdx-checkbox-next-v)'        ,{nowait = true})

-- vim.api.nvim_buf_set_keymap(0,'i','<M-CR>'     ,'<C-R>=mkdx#EnterHandler()<Cr>'       ,{nowait = true  ,noremap = true})

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
