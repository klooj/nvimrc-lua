let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" sfile = init.lua; :p = absolute name; each :h removes a trailing component
let s:load_dir = expand('<sfile>:p:h:h:h')

" exec = run code resulting from following expr as ex command
exec printf("luafile %s/lua/init.lua", s:load_dir)


" luafile "$FOONV/lua/init.lua"
"
" augroup startscreen
"   au!
"   autocmd VimEnter * ++once lua require('klooj.start').start()
" augroup END
