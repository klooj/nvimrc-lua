-- the organization below is slowly deteriorating as I experiment with grouping items by layout rather than functionality

local pbind    = require('poob.plbind')
local map_cr   = pbind.map_cr     --  self.cmd = (":%s<CR>"):format(cmd_string)
local map_cu   = pbind.map_cu     -- self.cmd = (":<C-u>%s<CR>"):format(cmd_string)
local map_cmd  = pbind.map_cmd   -- self.cmd = cmd_string
-- local map_args = pbind.map_args -- self.cmd = (":%s<Space>"):format(cmd_string)

local maps = setmetatable({}, { __index = { vim = {}, plugin = {}, whichKey= {} } })

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

--[[
leader maps; these are displayed by which-key popup
==============================]]

function maps:load_whichKey_define()
  self.whichKey = {
    ["n|<Leader>"]         = map_cu("silent WhichKey '<Space>'"):with_noremap():with_silent()       ,
    ["v|<Leader>"]         = map_cu("silent WhichKeyVisual '<Space>'"):with_noremap():with_silent() ,
    ["n|<LocalLeader>"]    = map_cu("silent WhichKey '\\'"):with_noremap():with_silent()            ,
    ["v|<LocalLeader>"]    = map_cu("silent WhichKeyVisual '\\'"):with_noremap():with_silent()      ,
    ["n|<leader><leader>"] = map_cmd([[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]]):with_noremap():with_expr(),
    -- ["n|<LocalLeader>x"]   = map_cr("ToggleCheckbox"):with_noremap(),

    ["n|<Leader>,"]       = map_cr("Commentary"):with_noremap():with_silent()               ,
    ["x|<Leader>,"]       = map_cr("'<,'>Commentary"):with_noremap():with_silent()          ,
    ["n|<Leader>."]       = map_cr([[vsplit $FOONV/init.lua]]):with_noremap():with_silent() ,
    ["n|<Leader>\\"]      = map_cr("NvimTreeToggle"):with_noremap():with_silent()           ,
    ["n|<Leader>="]       = map_cmd("<C-W>="):with_noremap():with_silent()                  ,
    ["n|<Leader><Left>"]  = map_cr("BufferMoveNext"):with_noremap():with_silent()           ,
    ["n|<Leader><Right>"] = map_cr("BufferMovePrevious"):with_noremap():with_silent()       ,
    -- |> [a]ctions
    ["n|<Leader>a#"] = map_cmd(":py3 import vim, random; vim.current.line += str(random.randint(0,9))<CR><esc>A"):with_noremap():with_silent(),
    ["n|<Leader>ac"] = map_cr("ColorizerToggle"):with_noremap():with_silent() ,
    ["n|<Leader>ah"] = map_cr("Helptags"):with_noremap():with_silent()        ,
    ["n|<Leader>au"] = map_cr("UndotreeToggle"):with_noremap():with_silent()  ,
    ["n|<Leader>aw"] = map_cr("StripWhitespace"):with_noremap():with_silent() ,
    --   |- [p]acker
    ["n|<Leader>apc"] = map_cr("PackerClean"):with_noremap():with_silent()   ,
    ["n|<Leader>app"] = map_cr("PackerCompile"):with_noremap():with_silent() ,
    ["n|<Leader>api"] = map_cr("PackerInstall"):with_noremap():with_silent() ,
    ["n|<Leader>aps"] = map_cr("PackerSync"):with_noremap():with_silent()    ,
    ["n|<Leader>apu"] = map_cr("PackerUpdate"):with_noremap():with_silent()  ,

    -- |> [A]dd lazy packs
    ["n|<Leader>Ac"] = map_cr([[source $FOONV/lazy/conf.vim ]]):with_noremap():with_silent()      ,
    ["n|<Leader>Ad"] = map_cr([[source $FOONV/lazy/dap.vim]]):with_noremap():with_silent()        ,
    ["n|<Leader>Av"] = map_cr([[source $FOONV/lazy/vimspector.vim]]):with_noremap():with_silent() ,
    ["n|<Leader>Ab"] = map_cr([[packadd vim-boxdraw]]):with_noremap():with_silent() ,

    -- |> [b]uffer
    ["n|<Leader>bb"] = map_cr("set scrollbind"):with_noremap():with_silent()                   ,
    ["n|<Leader>bc"] = map_cmd('"_c'):with_noremap():with_silent()                             ,
    ["n|<Leader>bd"] = map_cmd('"_d'):with_noremap():with_silent()                             ,
    ["n|<Leader>bh"] = map_cmd("<C-W>t<C-W>K"):with_noremap():with_silent()                    ,
    ["n|<Leader>bO"] = map_cr("BufferOrderByDirectory"):with_noremap():with_silent()           ,
    ["n|<Leader>bp"] = map_cr("BufferPick"):with_noremap():with_silent()                       ,
    ["n|<Leader>bR"] = map_cr("BufferCloseBuffersRight"):with_noremap():with_silent()          ,
    ["n|<Leader>bs"] = map_cr("call WindowSwap#EasyWindowSwap()"):with_noremap():with_silent() ,
    ["n|<Leader>bv"] = map_cmd("<C-W>t<C-W>H"):with_noremap():with_silent()                    ,
    ["n|<Leader>bw"] = map_cr("BufferWipeout"):with_noremap():with_silent()                    ,
    ["n|<Leader>bx"] = map_cr("BufferClose"):with_noremap():with_silent()                      ,
    ["n|<Leader>bX"] = map_cr("BufferCloseAllButCurrent"):with_noremap():with_silent()         ,
    --     |- [b]uf [o]ptions
    ["n|<Leader>boc"] = map_cr("set cursorcolumn"):with_noremap():with_silent()                               ,
    ["n|<Leader>boC"] = map_cr("set nocursorcolumn"):with_noremap():with_silent()                             ,
    ["n|<Leader>bow"] = map_cr("hi ColorColumn ctermbg=202020 guibg=202020"):with_noremap():with_silent()     ,
    ["n|<Leader>boW"] = map_cr("hi ColorColumn ctermbg=darkcyan guibg=darkcyan"):with_noremap():with_silent() ,
    ["n|<Leader>boN"] = map_cr("set nonumber!"):with_noremap():with_silent()                                  ,
    ["n|<Leader>bon"] = map_cr("set number!"):with_noremap():with_silent()                                    ,

    -- |> [d]ebug
    ["n|<Leader>dM"]  = map_cr("Neomake"):with_noremap():with_silent() ,
    ["n|<Leader>ddo"] = map_cr("Luadev"):with_noremap():with_silent()  ,
    ["n|<Leader>ddl"] = map_cmd("<Plug>(Luadev-RunLine)")              ,
    ["v|<Leader>ddv"] = map_cmd("<Plug>(Luadev-Run)")                  ,
    ["n|<Leader>ddw"] = map_cmd("<Plug>(Luadev-RunWord)")              ,

    -- |> [e]dit
    ["n|<Leader>e."] = map_cr([[vsplit $FOONV/init.lua]]):with_noremap()                  ,
    ["n|<Leader>ec"] = map_cr([[vsplit $FOONV/lua/plugin/completion.lua]]):with_noremap() ,
    ["n|<Leader>ee"] = map_cr("Telescope symbols"):with_noremap()                         ,
    ["n|<Leader>ek"] = map_cr([[vsplit $FOONV/lua/domain/keymaps.lua]]):with_noremap()    ,
    ["n|<Leader>eL"] = map_cr([[vsplit $FOONV/lua/plugin/lsp_config.lua]]):with_noremap() ,
    ["n|<Leader>ep"] = map_cr([[vsplit $FOONV/lua/domain/plugins.lua]]):with_noremap()    ,
    ["n|<Leader>et"] = map_cr([[vsplit ~/Desktop/info/todo.md]]):with_noremap()           ,
    ["n|<Leader>ew"] = map_cr([[vsplit $FOONV/lua/plugin/whichKey.lua]]):with_noremap()   ,

    -- |> [f]ind (most of this is in lua/klooj/telesceope/init.lua )
    ["n|<Leader>ff"] = map_cr("lua require('telescope').extensions.fzf_writer.staged_grep()"):with_noremap() ,
    ["n|<Leader>fz"] = map_cr("lua require('telescope').extensions.fzf_writer.files()"):with_noremap()       ,
    ["n|<Leader>fZ"] = map_cr("lua require('telescope').extensions.fzf_writer.grep()"):with_noremap()        ,

    -- [g]it
    ["n|<Leader>ga"]  = map_cr("Git add ."):with_noremap()                               ,
    ["n|<Leader>gb"]  = map_cr("GBrowse"):with_noremap()                                 ,
    ["x|<Leader>gb"]  = map_cr("GBrowse"):with_noremap()                                 ,
    ["n|<Leader>gc"]  = map_cr("Gcommit"):with_noremap()                                 ,
    ["n|<Leader>gd"]  = map_cr("Gdiffsplit!"):with_noremap()                             ,
    ["n|<Leader>gf"]  = map_cr("diffget //2")                                            ,

    ["n|<Leader>ghs"] = map_cr("lua require'gitsigns'.stage_hunk()"):with_noremap()      ,
    ["n|<Leader>ghu"] = map_cr("lua require'gitsigns'.undo_stage_hunk()"):with_noremap() ,
    ["n|<Leader>ghr"] = map_cr("lua require'gitsigns'.reset_hunk()"):with_noremap()      ,
    ["n|<Leader>ghp"] = map_cr("lua require'gitsigns'.preview_hunk()"):with_noremap()    ,
    ["n|<Leader>ghb"] = map_cr("lua require'gitsigns'.blame_line()"):with_noremap()      ,

    ["n|<Leader>gj"]  = map_cr("diffget //3")                                            ,
    ["n|<Leader>gl"]  = map_cr("Git log"):with_noremap()                                 ,
    ["n|<Leader>gm"]  = map_cr("Git mergetool"):with_noremap()                           ,
    ["n|<Leader>gp"]  = map_cr("Git pull"):with_noremap()                                ,
    ["n|<Leader>gP"]  = map_cr("Git push"):with_noremap()                                ,
    ["n|<Leader>gS"]  = map_cr("G"):with_silent()                                        ,
    ["n|<Leader>gs"]  = map_cr("Gstatus"):with_noremap()                                 ,
    ["n|<Leader>gV"]  = map_cr("GV!"):with_noremap()                                     ,
    ["n|<Leader>gv"]  = map_cr("GV"):with_noremap()                                      ,
    --
    ["n|<Leader>h"]   = map_cmd("<C-W>s"):with_noremap():with_silent()                        ,
    ["n|<Leader>H"]   = map_cr("echo synIDattr(synID(line('.'), col('.'), 1), 'name')"):with_noremap():with_silent() ,
    ["n|<Leader>j"]   = map_cr("AnyJump"):with_noremap():with_silent()                        ,
    ["x|<Leader>j"]   = map_cr("AnyJumpVisual"):with_noremap():with_silent()                  ,
    ["n|<Leader>k"]   = map_cr("BufferPick"):with_noremap():with_silent()                     ,

    -- |> [q]uickfix
    ["n|<Leader>qp"] = map_cmd("<Plug>(qf_qf_previous)")                   ,
    ["n|<Leader>qn"] = map_cmd("<Plug>(qf_qf_next)")                       ,
    ["n|<Leader>q["] = map_cmd("<Plug>(qf_loc_previous)")                  ,
    ["n|<Leader>q]"] = map_cmd("<Plug>(qf_loc_next)")                      ,
    ["n|<Leader>qj"] = map_cmd("<Plug>(qf_qf_switch)")                     ,
    ["n|<Leader>qt"] = map_cmd("<Plug>(qf_qf_toggle)")                     ,
    ["n|<Leader>qs"] = map_cmd("<Plug>(qf_qf_toggle_stay)")                ,
    ["n|<Leader>qT"] = map_cmd("<Plug>(qf_loc_toggle)")                    ,
    ["n|<Leader>qS"] = map_cmd("<Plug>(qf_loc_toggle_stay)")               ,
    ["n|<Leader>qo"] = map_cmd("<Plug>(qf_older)")                         ,
    ["n|<Leader>qr"] = map_cmd("<Plug>(qf_newer)")                         ,
    ["n|<Leader>qb"] = map_cmd("<Plug>(qf_previous_file)")                 ,
    ["n|<Leader>qf"] = map_cmd("<Plug>(qf_next_file)")                     ,

    -- |> [t]able
    -- tf<char> uses the first <char> as separator; applies in most common cases in visual and normal
    ["n|<Leader>t "]   = map_cr("Tabularize spaces"):with_noremap()           ,
    ["n|<Leader>t*"]   = map_cr("Tabularize asterisk"):with_noremap()         ,
    ["n|<Leader>ta"]   = map_cr("Tabularize assignment"):with_noremap()       ,
    ["n|<Leader>tf#"]  = map_cr("Tabularize f_hash"):with_noremap()           ,
    ["n|<Leader>tf'"]  = map_cr("Tabularize f_quoteS"):with_noremap()         ,
    ["n|<Leader>tf("]  = map_cr("Tabularize f_parenO"):with_noremap()         ,
    ["n|<Leader>tf)"]  = map_cr("Tabularize f_parenC"):with_noremap()         ,
    ["n|<Leader>tf,"]  = map_cr("Tabularize f_comma"):with_noremap()          ,
    ["n|<Leader>tf-"]  = map_cr("Tabularize f_hyphen"):with_noremap()         ,
    ["n|<Leader>tf."]  = map_cr("Tabularize f_period"):with_noremap()         ,
    ["n|<Leader>tf/"]  = map_cr("Tabularize f_slashF"):with_noremap()         ,
    ["n|<Leader>tf:"]  = map_cr("Tabularize f_colon"):with_noremap()          ,
    ["n|<Leader>tf;"]  = map_cr("Tabularize f_semi"):with_noremap()           ,
    ["n|<Leader>tf="]  = map_cr("Tabularize f_equal"):with_noremap()          ,
    ["n|<Leader>tf["]  = map_cr("Tabularize f_brackO"):with_noremap()         ,
    ["n|<Leader>tf\\"] = map_cr("Tabularize f_slashB"):with_noremap()         ,
    ["n|<Leader>tf]"]  = map_cr("Tabularize f_brackC"):with_noremap()         ,
    ["n|<Leader>tf{"]  = map_cr("Tabularize f_squirlyO"):with_noremap()       ,
    ["n|<Leader>tf}"]  = map_cr("Tabularize f_squirlyC"):with_noremap()       ,
    ["n|<Leader>t|"]   = map_cr("Tabularize ternary_operator"):with_noremap() ,
    ['n|<Leader>t2 ']  = map_cr("Tabularize two_spaces"):with_noremap()       ,
    ['n|<Leader>tf ']  = map_cr("Tabularize f_space"):with_noremap()          ,
    ['n|<Leader>tf"']  = map_cr("Tabularize f_quoteD"):with_noremap()         ,
    ['n|<Leader>tRl']  = map_cr("Tabularize multiple_spaces"):with_noremap()  ,
    ['n|<Leader>tRm']  = map_cr("Tabularize remove_leading_spaces"):with_noremap()  ,

    ["x|<Leader>t "]   = map_cr("Tabularize spaces"):with_noremap()           ,
    ["x|<Leader>t*"]   = map_cr("Tabularize asterisk"):with_noremap()         ,
    ["x|<Leader>ta"]   = map_cr("Tabularize assignment"):with_noremap()       ,
    ["x|<Leader>tf*"]  = map_cr("Tabularize f_asterisk"):with_noremap()       ,
    ["x|<Leader>tf#"]  = map_cr("Tabularize f_hash"):with_noremap()           ,
    ["x|<Leader>tf'"]  = map_cr("Tabularize f_quoteS"):with_noremap()         ,
    ["x|<Leader>tf("]  = map_cr("Tabularize f_parenO"):with_noremap()         ,
    ["x|<Leader>tf)"]  = map_cr("Tabularize f_parenC"):with_noremap()         ,
    ["x|<Leader>tf,"]  = map_cr("Tabularize f_comma"):with_noremap()          ,
    ["x|<Leader>tf-"]  = map_cr("Tabularize f_hyphen"):with_noremap()         ,
    ["x|<Leader>tf."]  = map_cr("Tabularize f_period"):with_noremap()         ,
    ["x|<Leader>tf/"]  = map_cr("Tabularize f_slashF"):with_noremap()         ,
    ["x|<Leader>tf:"]  = map_cr("Tabularize f_colon"):with_noremap()          ,
    ["x|<Leader>tf;"]  = map_cr("Tabularize f_semi"):with_noremap()           ,
    ["x|<Leader>tf="]  = map_cr("Tabularize f_equal"):with_noremap()          ,
    ["x|<Leader>tf["]  = map_cr("Tabularize f_brackO"):with_noremap()         ,
    ["x|<Leader>tf\\"] = map_cr("Tabularize f_slashB"):with_noremap()         ,
    ["x|<Leader>tf]"]  = map_cr("Tabularize f_brackC"):with_noremap()         ,
    ["x|<Leader>tf{"]  = map_cr("Tabularize f_squirlyO"):with_noremap()       ,
    ["x|<Leader>tf}"]  = map_cr("Tabularize f_squirlyC"):with_noremap()       ,
    ["x|<Leader>t|"]   = map_cr("Tabularize ternary_operator"):with_noremap() ,
    ['x|<Leader>t2 ']  = map_cr("Tabularize two_spaces"):with_noremap()       ,
    ['x|<Leader>tf ']  = map_cr("Tabularize f_space"):with_noremap()          ,
    ['x|<Leader>tf"']  = map_cr("Tabularize f_quoteD"):with_noremap()         ,
    ['x|<Leader>tRl']  = map_cr("Tabularize multiple_spaces"):with_noremap()  ,
    ['x|<Leader>tRm']  = map_cr("Tabularize remove_leading_spaces"):with_noremap()  ,

    ["n|<Leader>v"]    = map_cmd("<C-W>v"):with_noremap():with_silent()                        ,
    ["n|<Leader>V"]    = map_cr("vertical wincmd f"):with_noremap():with_silent()              ,
    ["n|<Leader>z"]    = map_cr([[vsplit ~/.zshrc]]):with_noremap():with_silent()              ,

  }
end

function maps:load_vim_define()
self.vim= {
-- moving within and among text, windows, buffers, and tabs
    ["n|k"]       = map_cmd('gk'):with_noremap()                    ,
    ["n|j"]       = map_cmd('gj'):with_noremap()                    ,
    ["n|<C-h>"]   = map_cmd('<C-w>h'):with_noremap()                ,
    ["n|<C-l>"]   = map_cmd('<C-w>l'):with_noremap()                ,
    ["n|<C-j>"]   = map_cmd('<C-w>j'):with_noremap()                ,
    ["n|<C-k>"]   = map_cmd('<C-w>k'):with_noremap()                ,
    ["n|<Right>"] = map_cmd('gt'):with_noremap()                    ,
    ["n|<Left>"]  = map_cmd('gT'):with_noremap()                    ,
    ["n|<Up>"]    = map_cmd('<C-y>'):with_noremap()                 ,
    ["n|<Down>"]  = map_cmd('<C-e>'):with_noremap()                 ,
    -- humane escape from insert mode
    ["i|jj"] = map_cmd('<ESC>'):with_noremap()                 ,
    ["i|jk"] = map_cmd('<ESC>'):with_noremap()                 ,
    ["i|kj"] = map_cmd('<ESC>'):with_noremap()                 ,
    -- resize windows
    ["n|<M-k>"] = map_cmd('<C-W>+'):with_noremap():with_silent()  ,
    ["n|<M-j>"] = map_cmd('<C-W>-'):with_noremap():with_silent()  ,
    ["n|<M-h>"] = map_cmd('<C-W>5>'):with_noremap():with_silent() ,
    ["n|<M-l>"] = map_cmd('<C-W>5<'):with_noremap():with_silent() ,
    -- tab: completion magic and buffers
    ["i|<TAB>"]   = map_cmd([[pumvisible() ? "\<C-n>" : v:lua.check_back_space() ? "\<TAB>" : completion#trigger_completion()]]):with_expr():with_silent(),
    ["i|<S-TAB>"] = map_cmd([[pumvisible() ? "\<C-p>" : "<Plug>(completion_smart_s_tab)"]]):with_expr():with_silent(),
    ["n|<TAB>"]   = map_cr("BufferNext"):with_noremap():with_silent()          , --barbar
    ["n|<S-TAB>"] = map_cr("BufferPrevious"):with_noremap():with_silent()      ,
    ["i|<C-'>"]   = map_cmd("<Plug>(completion_next_source)"):with_silent()    ,
    ["i|<C-;>"]   = map_cmd("<Plug>(completion_prev_source)"):with_silent()    ,
    ["i|<CR>"]    = map_cmd([[pumvisible() ? complete_info()["selected"] != "-1" ?"\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>":(delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")]]):with_expr(),

    -- ["i|<C-;>"]   = map_cr("lua require('snippets').expand_or_advance(-1)"):with_noremap():with_silent(),
    -- ["i|<C-'>"]   = map_cr("lua require('snippets').advance(1)"):with_noremap():with_silent(),

    -- text: sort, indent, caps, visual "drag and drop"
    ["x|<"]     = map_cmd('<gv'):with_noremap()                 ,
    ["x|>"]     = map_cmd('>gv'):with_noremap()                 ,
    ["n|<C-<>"] = map_cr("SidewaysLeft"):with_noremap()         , -- " ctrl + left/right to move args around
    ["n|<C->>"] = map_cr("SidewaysRight"):with_noremap()        ,
    ["x|<F8>"]  = map_cr("sort i"):with_noremap()               ,
    ["x|<S-k>"] = map_cmd(":move '<-2<CR>gv-gv"):with_noremap() , -- " Move selected line / block of text in visual mode
    ["x|<S-j>"] = map_cmd(":move '>+2<CR>gv-gv"):with_noremap() , -- " shift + k to move up; shift + j to move down
    ["i|<F7>"]  = map_cmd('<Esc>gUiw`]a')                       , -- upper case word before cursor

  }
end

function maps:load_plugin_define()
  self.plugin = {
    --[[
    === local autoload functions ===
    ]]
    -- lines: pad, join, jump over empty
    ["n|<S-BS>"] = map_cr("call kp#padDelBelow()"):with_noremap():with_silent()            ,
    ["i|<S-BS>"] = map_cmd("<C-O>:call kp#padDelBelow()<CR>"):with_noremap():with_silent() ,
    ["n|<S-CR>"] = map_cr("call kp#padBelow()"):with_noremap():with_silent()               ,
    ["i|<S-CR>"] = map_cmd("<C-O>:call kp#padBelow()<CR>"):with_noremap():with_silent()    ,
    ["n|<C-CR>"] = map_cr("call kp#padAbove()"):with_noremap():with_silent()               ,
    ["i|<C-CR>"] = map_cmd("<C-O>:call kp#padAbove()<CR>"):with_noremap():with_silent()    ,
    ["n|<C-BS>"] = map_cr("call kp#padDelAbove()"):with_noremap():with_silent()            ,
    ["i|<C-BS>"] = map_cmd("<C-O>:call kp#padDelAbove()<CR>"):with_noremap():with_silent() ,
    ["n|J"]      = map_cr("call tj#join_lines()"):with_noremap()                           ,
    ["n|gj"]     = map_cmd([[<cmd>let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>]]):with_noremap(),
    ["n|gk"]     = map_cmd([[<cmd>let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>]]):with_noremap(),

    --[[
    ===  3rd party ===
    ]]

    ["n|<C-1>"] = map_cmd("<Plug>(dial-decrement)")                                      , -- dial (like speeddating)
    ["n|<C-2>"] = map_cmd("<Plug>(dial-increment)")                                      ,
    ["n|<F6>"]  = map_cr("MaximizerToggle"):with_noremap():with_silent()                 , -- maximizer
    ["i|<F6>"]  = map_cmd("<C-O>:call MaximizerToggle<CR>"):with_noremap():with_silent() ,
    ["x|<F6>"]  = map_cmd("<cmd>MaximizerToggle<CR>gv"):with_noremap():with_silent()     ,
    ["t|<ESC>"] = map_cu([[<C-\><C-n>]]):with_noremap()                                  , -- terminal
    ["n|<F5>"]  = map_cr("UndotreeToggle"):with_noremap()                                ,

  }
end


local function load_maps()
maps:load_vim_define()
maps:load_plugin_define()
maps:load_whichKey_define()
pbind.nvim_load_mapping(maps.vim)
pbind.nvim_load_mapping(maps.plugin)
pbind.nvim_load_mapping(maps.whichKey)
end

load_maps()

----------------------------------
--[===[ these still need doing
nnoremap <Leader>dl <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

compe:
    -- ["i|<C-'>"]   = map_cmd([[compe#scroll({ 'delta': -4 })]]):with_expr():with_silent()    ,
    -- ["i|<C-;>"]   = map_cmd([[compe#scroll({ 'delta': +4 })]]):with_expr():with_silent()    ,
    -- ["i|<CR>"]    = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_nowait(),
    -- ["i|<C-Space>"]   = map_cmd([[compe#complete()]]):with_expr():with_silent()    ,
    -- ["i|<C-e>"]   = map_cmd([[compe#close()]]):with_expr():with_silent()    ,



this is from rainbow plugin suggestions:
The following keymappings will help you to check the syntax name and definitions under the cursor, add them to your vimrc and restart vim:
nnoremap <f1> :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <f2> :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <f3> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
nnoremap <f4> :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>

    -- ["n|<"]     = map_cmd('<<'):with_noremap()                  ,
    -- ["n|>"]     = map_cmd('>>'):with_noremap()                  ,
-- ["n|]w"]         = map_cu('WhitespaceNext'):with_noremap():with_silent(),
-- ["n|<Leader>r"]  = map_cr("<cmd> lua require'klooj.selfunc'.run_command()"):with_noremap():with_silent(),
-- ["n|]e"]         = map_cmd("<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>"):with_noremap():with_silent(),

-- ["i|<LocalLeader>]"]  = map_cmd("<C-O><Plug>(completion_next_source)"):with_noremap()      ,
-- ["i|<LocalLeader>["]  = map_cmd("<C-O><Plug>(completion_prev_source)"):with_noremap()      ,

-- " " " imap <C-,>
-- " " " imap <C-.> <Plug>(completion_prev_source)
-- ["t|<F1>"]      = map_cu([[<C-\><C-n>:FloatermKill<CR>]]):with_noremap(),
-- ["t|<F2>"]      = map_cu([[<C-\><C-n>:FloatermNew<CR>]]):with_noremap(),
-- ["t|<F3>"]      = map_cu([[<C-\><C-n>:FloatermToggle<CR>]]):with_noremap(),
-- ["t|<F4>"]      = map_cu([[<C-\><C-n>:FloatermNext<CR>]]):with_noremap(),
-- ["n|<F2>"]      = map_cr("call kp#floaterm()"):with_noremap(),
-- ["n|<F3>"]      = map_cr("FloatermToggle"):with_noremap(),
-- ["n|<F4>"]      = map_cr("FloatermNext"):with_noremap(),
]===]
