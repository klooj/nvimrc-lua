scriptencoding utf-8
" functions called by keymaps and rando utilities

" vim autoload naming convention
" function foo#bar#yerp()
" file containing function definitions, including yerp(): /autoload/foo/bar.vim
" :call foo#bar#yerp()
" ======================================
" fdm=expr or syntax
"{{{ padding func
" add or remove blank lines; uses the same key combo in normal and insert modes
function! kp#padBelow() abort
	call append(line("."), "")
endfunction
function! kp#padAbove() abort
	let l:scrolloffsave = &scrolloff
	" Avoid jerky scrolling with ^E at top of window
	set scrolloff=0
	call append(line(".") - 1, "")
	if winline() != winheight(0)
		silent normal! <C-e>
	end
	let &scrolloff = l:scrolloffsave
endfunction
function! kp#padDelBelow() abort
	if line(".") == line("$")
		return
	end
	let l:line = getline(line(".") + 1)
	if l:line =~ '^\s*$'
		let l:colsave = col(".")
		.+1d
		''
		call cursor(line("."), l:colsave)
	end
endfunction
function! kp#padDelAbove() abort
	if line(".") == 1
		return
	end
	let l:line = getline(line(".") - 1)
	if l:line =~ '^\s*$'
		let l:colsave = col(".")
		.-1d
		silent normal! <C-y>
		call cursor(line("."), l:colsave)
	end
endfunction
"}}}

" {{{ right align keyword
" for the line under the cursor, right align the final keyword string object
" at textwidth column. kludge for anchored text links within any file so i
" can jump around a file using a makeshift TOC with '%'.
" this hack is both over complicated and too simple, and I use it constantly.
" function! kp#rightAlignEndword() abort
"  let line = getline(".")
"  let [header, link] = split(line, '^\s*.*\%(\k?\|\s\)\+\zs\s*')
"  let header = substitute(header, '^\_s*\|\_s*$', '', 'g')
"  let remainder = (&l:textwidth) - len(header) - len(link)
"  let line = header.repeat(' ', remainder).link
"  call setline(".", line)
"  return
" endfunction
"}}}

" {{{ floaterm
" TODO: combine new and toggle into the same function, which would check for an
" existing term before creating a new one.
"function! kp#floaterm() abort
" if !exists('g:loaded_floaterm')
"  packadd vim-floaterm
" endif
" FloatermNew
"endfunction
"" }}}

""{{{ pipe output from ex command to new tab
function! kp#Pipetab(cmd) abort
	redir => message
	silent execute a:cmd
	redir END
	if empty(message)
		echoerr "no output"
	else
		" use "new" instead of "tabnew" below if you prefer split windows instead of tabs
		tabnew
		setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
		silent put=message
	endif
endfunction
"}}}
"
"{{{ pipe output from ex command to split
function! kp#Pipesplit(...) abort
	let cmd = join(a:000, ' ')
	let temp_reg = @"
	redir @"
	silent! execute cmd
	redir END
	let output = copy(@")
	let @" = temp_reg
	if empty(output)
		echoerr "no output"
	else
		new
		setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
		put! =output
	endif
endfunction
"}}}

" rg pipe to fzf for post processing
function! kp#RipgrepFzf(query, fullscreen) abort
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" maximize the active window
fun! kp#maximizerMaximize()
	let t:maximizer_sizes = { 'before': winrestcmd() }
	vert resize | resize
	let t:maximizer_sizes.after = winrestcmd()
	normal! ze
endfun

fun! kp#maximizerRestore()
	if exists('t:maximizer_sizes')
		silent! exe t:maximizer_sizes.before
		if t:maximizer_sizes.before != winrestcmd()
			wincmd =
		endif
		unlet t:maximizer_sizes
		normal! ze
	end
endfun

fun! kp#maximizerToggle(force)
	if exists('t:maximizer_sizes') && (a:force || (t:maximizer_sizes.after == winrestcmd()))
		call kp#maximizerRestore()
	elseif winnr('$') > 1
		call kp#maximizerMaximize()
	endif
endfun
