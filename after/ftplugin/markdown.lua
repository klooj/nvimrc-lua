local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local xnoremap = vim.keymap.xnoremap

vim.cmd[[setl nofoldenable]]

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
