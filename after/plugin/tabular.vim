if !exists(':Tabularize')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" AddTabularPattern! nvar /nvarchar(\w*)/l1r0
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

AddTabularPipeline! remove_leading_spaces /^ / map(a:lines, "substitute(v:val, '^ *', '', '')")

function! TableChar() abort
	if !exists(':Tabularize')
		finish
	endif
	call inputsave()
	let l:tabch = input('enter character to align on: ')
	call inputrestore()
	exec printf("Tabularize /^[^%s]*\zs%s/", l:tabch)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
