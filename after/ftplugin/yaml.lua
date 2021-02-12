vim.cmd[[setl autoindent expandtab indentkeys-=<:> iskeyword+=-,$,# sw=2 sts=2 ts=2]]


-- " if &expandtab
-- " 	" ## Enable the indent guides on enter and disable on exit.
-- " 	"    This is to prevent conflict with the previously existing indent-guide method for tabs.
-- " 	augroup indent_guides_toggle
-- " 		autocmd BufEnter *.yaml execute 'IndentGuidesEnable'
-- " 		autocmd BufLeave *.yaml execute 'IndentGuidesDisable'
-- " 	augroup end
-- " else
-- " 	" ## Enable the indent guides on enter and disable on exit.
-- " 	"    This is to prevent conflict with the previously existing indent-guide method for tabs.
-- " 	augroup indent_guides_toggle
-- " 		autocmd! BufEnter *.yaml
-- " 		autocmd! BufLeave *.yaml
-- " 	augroup end
-- " endif
