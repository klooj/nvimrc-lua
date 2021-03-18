-- TODO: define keymaps and write out the functions below

vim.g.R_assign = 0        -- disables mapping underscore to <-
vim.g.R_user_maps_only = 1
vim.g.R_csv_app = 'terminal:vd'
vim.g.R_listmethods = 1

-- vim.g.R_bracketed_paste = 1
vim.g.R_hi_fun = 0        -- disable syntax highlighting to avoid conflict with treesitter
-- vim.g.R_external_term = 1 -- if i want to use tmux instead of embedded term
-- vim.g.R_auto_start = 2    -- on opening an r file
-- vim.g.R_auto_scroll = 0   -- this was annoying AF in RStudio
-- vim.g.R_esc_term = 0      -- i already have this set in terminals but not sure if it will apply to r console
-- vim.g.R_setwidth = 0
-- vim.g.R_args = {'--no-save', '--quiet'}
-- vim.g.R_notmuxconf = 1    -- use my tmux conf instead

-- vim.g.markdown_fenced_languages = ['r', 'python']
-- vim.g.rmd_fenced_languages = ['r', 'python']
-- vim.g.R_non_r_compl = 0     -- disable completion of other languages in fenced blocks


--[[  helper functions

r package for coloring console output
  library(colorout)

If you are on Mac OS X and want to use the R.app graphical application, put in
your |vimrc|:
   let R_external_term = 1
   let R_applescript = 1

If you want to disable only some of Nvim-R commands, create a Vim list with
their key bindings names in your |vimrc|. The complete list of key bindings
names is shown at the Custom key bindings section (Nvim-R-key-bindings).
Below is an example on how to disable the commands that sends `setwd()` and
`dput()` to R Console:
   let R_disable_cmds = ['RSetwd', 'RDputObj']

]]



--[[  keymaps
-- nmap <LocalLeader>: :RSend
-- to operate on word under cursor, might need to add iskeyword as second arg in these
-- nmap <silent> <LocalLeader>rk :call RAction("levels")<CR>
-- nmap <silent> <LocalLeader>t :call RAction("tail")<CR>
-- nmap <silent> <LocalLeader>H :call RAction("head")<CR>
-- vmap <silent> <LocalLeader>h :call RAction("head", "v")<CR>
]]


--[[  external terminal
 Nvim-R stores the environment variable $WINDOWID of the terminal where R is
 running as $RCONSOLE. Thus, if you are running R in a external terminal
 emulator on Linux, `~/bin` is in your path, and you want to resize and change
 the positions of the terminals containing Vim and R, you may create a
 script `~/bin/after_R_start` similar to the following. Then, make the script executable, and put
 in your vimrc:
    let R_external_term = 1
    let R_after_start = ['!after_R_start']
Similarly, on Mac OS X, the script below (developed by songcai) will bring the
focus to Neovim terminal window:

#!/usr/bin/env osascript

Raise the Terminal window containing name ".R".
  tell application "Terminal"
    set index of window 1 where name contains ".R" to 1
    delay 0.05
    activate window 1
  end tell

  --Click the title bar of the raised window to bring focus to it.
  tell application "System Events"
    tell process "Terminal"
      click menu item (name of window 1) of menu of menu bar item "Window" of menu bar 1
    end tell
  end tell


" Emulate Tmux ^az
  function ZoomWindow()
      let cpos = getpos(".")
      tabnew %
      redraw
      call cursor(cpos[1], cpos[2])
      normal! zz
  endfunction
  nmap gz :call ZoomWindow()<CR>
Then, you can open the current buffer in a new tab to get it occupying the whole screen
]]

--[[  companions plugins
investigate:
  https://github.com/jalvesaq/zotcite
  https://github.com/rafaqz/citation.vim
  mllg/vim-devtools-plugin
  https://github.com/vim-voom/VOoM
    vim.g.voom_ft_modes = {rmd ='pandoc', rnoweb = 'latex'}

configure:
  In Skim, click in the drop down menu and fill the fields:
   Skim
   Settings
   Sync
   Preset: Custom
   Command: nclientserver
   Arguments: '%file' %line

]]
