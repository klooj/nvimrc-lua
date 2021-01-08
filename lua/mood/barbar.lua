--[[
colors are specified in:
~/.local/share/nvim/site/pack/packer/opt/modus-theme-vim/lua/modus-vivendi.lua
]]

vim.cmd[[let bufferline = {}]]
-- vim.g.bufferline = " "
-- local bline = vim.g.bufferline
-- bufferline = {}
local setopts = function ()
  vim.g.bufferline = {
    animation = 'both',
    maximum_padding = 4,
    shadow = true,
    icons = true,
    icon_separator_active = '⫸ ',
    icon_separator_inactive = ' ¦ ',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    closable = true,
    clickable = true,
    semantic_letters = true,
  }
end

local Color, colors, Group, groups, styles = require("colorbuddy").setup()
-- require('colorbuddy').colorscheme('modus-vivendi')

-- local bufferline = {}
Color.new('bg_tab_visible', '#A0A003')
Group.new('TabLineVis', colors.fg, colors.bg_tab_visible)
Color.new('extTodo', '#f4923b')
-- Group.new("Todo", colors.todo, colors.none, styles.bold)

local M ={}

function M.darkish()

  setopts()

  Color.new('tabCur_fg'      , '#000000')
  Color.new('tabMod'         , '#c8523b')
  Color.new('tabSign'        , '#22a355')
  Color.new('tabTar'         , '#fb6859')
  Color.new('tabVis'         , '#ffffff')
  Color.new('tabCur_bg'      , '#bf9fe4')
  Color.new('tabVis_bg'      , '#230631')
  Color.new('tabInactive_bg' , '#3d3d3d')
-- Color.new('', '#ffffff')
-- Color.new('', '#5ac3cf')
-- Color.new('', '#fb6859')
  Group.new("BufferCurrent"        , colors.tabCur_fg , colors.tabCur_bg)
  Group.new("BufferCurrentMod"     , colors.tabMod    , colors.tabCur_bg)
  Group.new("BufferCurrentSign"    , colors.tabSign   , colors.tabCur_bg)
  Group.new("BufferCurrentTarget"  , colors.tabTar    , colors.tabCur_bg)
  Group.new("BufferVisible"        , colors.tabVis    , colors.tabVis_bg)
  Group.new("BufferVisibleMod"     , colors.tabMod    , colors.tabVis_bg)
  Group.new("BufferVisibleSign"    , colors.tabSign   , colors.tabVis_bg)
  Group.new("BufferVisibleTarget"  , colors.tabTar    , colors.tabVis_bg)
  Group.new("BufferInactive"       , colors.tabVis    , colors.tabInactive_bg)
  Group.new("BufferInactiveMod"    , colors.tabMod    , colors.tabInactive_bg)
  Group.new("BufferInactiveSign"   , colors.tabSign   , colors.tabInactive_bg)
  Group.new("BufferInactiveTarget" , colors.tabTar    , colors.tabInactive_bg)

  Group.new("Todo"            , colors.extTodo , colors.none     , styles.bold)
  Group.new('luaTodo'         , groups.Todo      , colors.none  , styles.bold)
end

function M.vendi()

  Group.new("BufferVisibleMod"     , colors.fg_mark_alt   , colors.magenta_nuanced_bg , styles.none)
  Group.new("BufferVisibleSign"    , colors.fg_tab_active , colors.magenta_nuanced_bg , styles.bold)
  Group.new("BufferVisibleTarget"  , colors.red_intense   , colors.magenta_nuanced_bg , styles.bold)

  Group.new("BufferInactive"       , colors.fg_main       , colors.bg_tab_inactive    , styles.none)
  Group.new("BufferInactiveMod"    , colors.fg_mark_alt   , colors.bg_tab_inactive    , styles.none)
  Group.new("BufferInactiveSign"   , colors.fg_tab_active , colors.bg_tab_inactive    , styles.bold)
  Group.new("BufferInactiveTarget" , colors.red_intense   , colors.bg_tab_inactive    , styles.bold)

end

return setmetatable({}, {
  __index = function(_, k)

    if M[k] then
      return M[k]
    else
      return require('mood.barbar')[k]
    end
  end
})

--[[

Color.new('bg_tab_visible', '#A0A003')
Group.new('TabLineVis', colors.fg, colors.bg_tab_visible)
  -- new defs
  -- Color.new('bg_tab_active', '#558800')
  -- Color.new('bg_tab_visible', '#103300')
  -- Color.new("magenta_nuanced_bg" , "#230631")
  Color.new('bg_tab_visible', '#A0A003')

  Color.new('bg_main', '#000000')
  Color.new('fg_mark_alt', '')
  Color.new('fg_tab_active', '')
  Color.new('red_intense', '')
  Color.new('fg_main', '')
  Color.new('fg_mark_alt', '')
  Color.new('fg_tab_active', '')
  Color.new('red_intense', '')
  Color.new('fg_main', '')
  Color.new('fg_mark_alt', '')
  Color.new('fg_tab_active', '')
  Color.new('red_intense', '')

From original vim setup:
" let bufferline = {}

" let bufferline.animation = 'v:both'
" let bufferline.maximum_padding = 4
" let bufferline.shadow = 'v:true'  " Show a shadow over the editor in buffer-pick mode
" let bufferline.icons = 'v:true'
" " let bufferline.icon_separator_active = '▎'
" let bufferline.icon_separator_active = '⫸ '
" let bufferline.icon_separator_inactive = '¦'
" let bufferline.icon_close_tab = ''
" let bufferline.icon_close_tab_modified = '●'
" let bufferline.closable = v:true
" let bufferline.clickable = v:true
" let bufferline.semantic_letters = v:true

"
"{{{scrap and instructions

" let bufferline.letters =
      " \ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

" let fg_modified = get(nvim_get_hl_by_name('WarningMsg',1) , 'foreground' , '#F5CB0E')
" let fg_special  = get(nvim_get_hl_by_name('Special'   ,1) , 'foreground' , '#7000CC')
" let bg_current  = get(nvim_get_hl_by_name('Normal'    ,1) , 'background' , '#558800')
" let bg_visible  = get(vim_get_hl_by_name('TabLineSel',1) , 'background' , '#114400')
" let bg_inactive = get(nvim_get_hl_by_name('TabLine'   ,1) , 'background' , '#000000')

"------------
" |> For the current active buffer
" exe 'hi BufferCurrent guibg=' . bg_current
" colors.bg_tab_active

" hi default link BufferCurrent      bg_current
" hi default link BufferCurrent      Normal

" |> For the current active buffer when modified
" exe 'hi default BufferCurrentMod guifg=' . fg_modified
" hi default link BufferCurrentMod   WarningMsg

" |>For the current active buffer icon
" hi default link BufferCurrentSign  Normal
" colors.bg_tab_active

" |>For the current active buffer target when buffer-picking
" exe 'hi default BufferCurrentTarget   guifg=red gui=bold guibg=' . bg_current

"------------
" |>For buffers visible but not the current one
" exe 'hi default BufferVisible guibg=' . bg_visible
" hi default link BufferVisible      TabLineSel

" hi default link BufferVisibleMod   TabLineSel
" exe 'hi default BufferVisibleMod guifg=' . fg_modified

" hi default link BufferVisibleSign  TabLineSel

" exe 'hi default BufferVisibleTarget   guifg=red gui=bold guibg=' . bg_visible

"------------
" |>For buffers invisible buffers
" hi default link BufferInactive     TabLine
" hi default link BufferInactiveMod  TabLine
" hi default link BufferInactiveSign TabLine
" exe 'hi default BufferInactiveTarget   guifg=red gui=bold guibg=' . bg_inactive

" For the shadow in buffer-picking mode
" hi default BufferShadow guifg=#000000 guibg=#000000

" if exists("syntax_on")
"   syntax reset
" endif
" " =================================================

" function bufferline#highlight#setup()
" let fg_target = 'red'

" let fg_current  = s:fg(['Normal'], '#efefef')
" let fg_visible  = s:fg(['TabLineSel'], '#efefef')
" let fg_inactive = s:fg(['TabLineFill'], '#888888')

" let fg_modified  = s:fg(['WarningMsg'], '#F5CB0E')
" let fg_special  = s:fg(['Special'], '#7000CC')
" let fg_special  = s:fg(['Special'], '#599eff')
" let fg_subtle  = s:fg(['NonText', 'Comment'], '#555555')

" let bg_current  = s:bg(['Normal'], '#CCFFAA')
" let bg_current  = s:bg(['Normal'], '#88AA55')
" let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#335500')
" let bg_visible  = s:bg(['TabLineSel', 'Normal'], '#A0A0A0')
" let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000')


"    "      Current: current buffer
"    "      Visible: visible but not current buffer
"    "     Inactive: invisible but not current buffer
"    "         -Mod: when modified
"    "        -Sign: the separator between buffers
"    "      -Target: letter in buffer-picking mode
" call s:hi_all([
"       \ ['BufferCurrent',        fg_current,  bg_current],
"       \ ['BufferCurrentMod',     fg_modified, bg_current],
"       \ ['BufferCurrentSign',    fg_special,  bg_current],
"       \ ['BufferCurrentTarget',  fg_target,   bg_current,   'bold'],
"       \ ['BufferVisible',        fg_visible,  bg_visible],
"       \ ['BufferVisibleMod',     fg_modified, bg_visible],
"       \ ['BufferVisibleSign',    fg_visible,  bg_visible],
"       \ ['BufferVisibleTarget',  fg_target,   bg_visible,   'bold'],
"       \ ['BufferInactive',       fg_inactive, bg_inactive],
"       \ ['BufferInactiveMod',    fg_modified, bg_inactive],
"       \ ['BufferInactiveSign',   fg_subtle,   bg_inactive],
"       \ ['BufferInactiveTarget', fg_target,   bg_inactive,  'bold'],
"       \ ['BufferTabpages',       fg_special,  bg_inactive, 'bold'],
"       \ ['BufferTabpageFill',    fg_inactive, bg_inactive],
"       \ ])
" endfunc
"}}}

  ]]
