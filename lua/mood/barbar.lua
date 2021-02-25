vim.g.bufferline = {
  animation = 'both',
  maximum_padding = 4,
  shadow = true,
  icons = true,
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  closable = true,
  clickable = true,
  semantic_letters = true,
}

local Color, colors, Group, groups, styles = require("colorbuddy").setup()

Color.new('bg_tab_visible', '#A0A003')
Group.new('TabLineVis', colors.fg, colors.bg_tab_visible)
Color.new('extTodo', '#f4923b')

Color.new('tabCur_fg'      , '#000000')
Color.new('tabMod'         , '#c8523b')
Color.new('tabSign'        , '#22a355')
Color.new('tabTar'         , '#ff0859')
Color.new('tabVis'         , '#ffffff')
Color.new('tabCur_bg'      , '#A0A003')
Color.new('tabVis_bg'      , '#bf9fe4')
Color.new('tabInactive_bg' , '#3d3d3d')

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

-- not sure if i still use this somewhere
Group.new("Todo"            , colors.extTodo , colors.none     , styles.bold)
Group.new('luaTodo'         , groups.Todo      , colors.none  , styles.bold)
