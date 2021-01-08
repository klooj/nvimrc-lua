packadd conf.vim
packadd standard.vim
packadd quickmenu.vim


" |> configuration plugin
if !get(g:, 'loaded_conf_vim', v:false)
  finish
endif

" I prefer to just echo out the debug info
call conf#runtime#set('runtime', 'debug_buffer', v:false)

" |> standard
command! CdGit call execute(':lcd ' . std#git#root())
command! CdAGit call execute(':lcd ' . std#git#root(expand('#:p')))
