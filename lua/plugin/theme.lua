local set_theme = function()
  if os.getenv("TRANSPARENT_TERM") then

    vim.cmd[[colorscheme gruvbox]]
    vim.cmd[[hi! Normal guibg=NONE ctermbg=NONE]]
    vim.cmd[[hi! CursorLine guibg=#080656 ]]
    -- vim.cmd[[hi LineNr ctermbg=NONE guibg=NONE]]

  else
    -- vim.cmd[[packadd zephyr-nvim]]
    require('colorbuddy').colorscheme('zephyr')
    -- vim.cmd[[packadd modus-theme-vim]]
    -- require('colorbuddy').colorscheme('modus-vivendi')
    -- vim.cmd[[packadd nvcode-color-schemes.vim]]
    -- require('colorbuddy').colorscheme('snazzy')
    -- vim.cmd[[packadd doom-one.vim]]
    --  require('colorbuddy').colorscheme('doom-one')
  end


end

set_theme()

vim.cmd[[hi! link colorcolumn cursorline]]
vim.cmd[[hi! link cursorcolumn cursorline]]
vim.cmd[[hi LineNr guifg=#824020]]
-- vim.cmd[[hi! LineNr guifg=#BB4422 ]]
require('plugin.vendiline')
require('plugin.barbar')
