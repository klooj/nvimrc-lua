" there a function in $FOONV/autoload/kp.vim
if !exists(':Tabularize')
  finish " Give up here; the Tabular plugin musn't have been loaded
endif
AddTabularPattern! nvar /nvarchar(\w*)/l1r0
AddTabularPattern! f_brackC /^[^\]]*\zs\]/
AddTabularPattern! f_brackO /^[^\[]*\zs\[/
AddTabularPattern! f_colon /^[^:]*\zs:/
AddTabularPattern! f_comma /^[^,]*\zs,/
AddTabularPattern! f_equal /^[^=]*\zs=/
AddTabularPattern! f_hash /^[^#]*\zs#/
AddTabularPattern! f_hyphen /^[^-]*\zs-/
AddTabularPattern! f_parenC /^[^)]*\zs)/
AddTabularPattern! f_parenO /^[^(]*\zs(/
AddTabularPattern! f_period /^[^\.]*\zs\./
AddTabularPattern! f_quoteD /^[^"]*\zs"/
AddTabularPattern! f_quoteS /^[^']*\zs'/
AddTabularPattern! f_semi /^[^;]*\zs;/
AddTabularPattern! f_slashB /^[^\\]*\zs\\/
AddTabularPattern! f_slashF /^[^\/]*\zs\//
AddTabularPattern! f_space /^[^\ ]*\zs\ /
AddTabularPattern! f_squirlyC /^[^}]*\zs}/
AddTabularPattern! f_squirlyO /^[^{]*\zs{/
AddTabularPattern! asterisk /*/l1
AddTabularPipeline! remove_leading_spaces /^ /
      \ map(a:lines, "substitute(v:val, '^ *', '', '')")
AddTabularPipeline! multiple_spaces / \{2,}/
      \ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
      \   | tabular#TabularizeStrings(a:lines, '  ', 'l0')


" Make line wrapping possible by resetting the 'cpo' option, first saving it
" let s:save_cpo = &cpo
" set cpo&vim

" " Restore the saved value of 'cpo'
" let &cpo = s:save_cpo
" unlet s:save_cpo
