local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local xnoremap = vim.keymap.xnoremap
local l = [[<leader>]]
local ll = [[<localleader>]]
local vc = vim.cmd

vc[[setl nofoldenable]]

inoremap{ '<M-CR>', function() vc[[InsertNewBullet]]  end, {nowait = true, buffer = true}}
inoremap{ '<C-T>', function() vc[[BulletDemote]]      end, {nowait = true, buffer = true}}
inoremap{ '<C-D>', function() vc[[BulletPromote]]     end, {nowait = true, buffer = true}}

nnoremap{l .. 'mcc' , function() vc[[WikiPageToc]]    end, {nowait = true , buffer = true}}
nnoremap{l .. 'mch' , function() vc[[Toch]]           end, {nowait = true , buffer = true}}
nnoremap{l .. 'mct' , function() vc[[Toct]]           end, {nowait = true , buffer = true}}
nnoremap{l .. 'mcv' , function() vc[[Tocv]]           end, {nowait = true , buffer = true}}
nnoremap{l .. 'mfP' , function() vc[[g/^/norm gqq]]   end, {nowait = true , buffer = true}}
nnoremap{l .. 'mha' , function() vc[[SetexToAtx]]     end, {nowait = true , buffer = true}}
nnoremap{l .. 'mhd' , function() vc[[HeaderDecrease]] end, {nowait = true , buffer = true}}
nnoremap{l .. 'mhi' , function() vc[[HeaderIncrease]] end, {nowait = true , buffer = true}}
nnoremap{l .. 'mP'  , function() vc[[Prettier]]       end, {nowait = true , buffer = true}}
nnoremap{l .. 'mpo' , function() vc[[MarkedOpen!]]    end, {nowait = true , buffer = true}}
nnoremap{l .. 'mpq' , function() vc[[MarkedQuit]]     end, {nowait = true , buffer = true}}
nnoremap{l .. 'mpt' , function() vc[[MarkedToggle]]   end, {nowait = true , buffer = true}}
nnoremap{l .. 'mt'  , function() vc[[TableFormat]]    end, {nowait = true , buffer = true}}

xnoremap{l .. 'mha' , function() vc[[SetexToAtx]]     end, {nowait = true , buffer = true}}
xnoremap{l .. 'mt'  , function() vc[[TableFormat]]    end, {nowait = true , buffer = true}}


nnoremap{ll .. '[' , function() vc[[BulletPromote]]        end, {nowait = true , buffer = true}}
nnoremap{ll .. ']' , function() vc[[BulletDemote]]         end, {nowait = true , buffer = true}}
nnoremap{ll .. 'B' , function() vc[[SelectBullet]]         end, {nowait = true , buffer = true}}
nnoremap{ll .. 'b' , function() vc[[SelectBulletText]]     end, {nowait = true , buffer = true}}
nnoremap{ll .. 'c' , function() vc[[SelectCheckbox]]       end, {nowait = true , buffer = true}}
nnoremap{ll .. 'C' , function() vc[[SelectCheckboxInside]] end, {nowait = true , buffer = true}}
nnoremap{ll .. 'o' , function() vc[[InsertNewBullet]]			 end, {nowait = true , buffer = true}}
nnoremap{ll .. 'r' , function() vc[[RenumberList]]         end, {nowait = true , buffer = true}}
-- nnoremap{ll .. 'x' , function() vc[[ToggleCheckbox]]			 end, {nowait = true , buffer = true}}

xnoremap{ll .. '[' , function() vc[[BulletPromoteVisual]]  end, {nowait = true, buffer = true}}
xnoremap{ll .. ']' , function() vc[[BulletDemoteVisual]]   end, {nowait = true, buffer = true}}
xnoremap{ll .. 'B' , function() vc[[SelectBullet]]         end, {nowait = true, buffer = true}}
xnoremap{ll .. 'b' , function() vc[[SelectBulletText]]     end, {nowait = true, buffer = true}}
xnoremap{ll .. 'r' , function() vc[[RenumberSelection]]    end, {nowait = true, buffer = true}}


-- lmaps = {
-- 	['c'] = 'SelectCheckbox',
-- 	['C'] = 'SelectCheckboxInside',
-- 	['b'] = 'SelectBulletText',
-- 	['B'] = 'SelectBullet',
-- 	['r'] = 'RenumberList',
-- 	['x'] = 'ToggleCheckbox',
-- 	[']'] = 'BulletDemote',
-- 	['['] = 'BulletPromote',
-- }
-- vim.g.lo_key_map = {}
-- VG('lo_key_map', lmaps)
-- vc[[call which_key#register('\\', "g:lo_key_map")]]
-- require('klooj.wk').lwk(lmaps)

-----------
-- nno{,,[[]],{}}
-- xno{,,[[]],{}}
-- {,,[[]],{}}
-- nowait = true, buffer = true
