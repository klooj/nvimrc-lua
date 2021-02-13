scriptencoding utf-8
" functions called by keymaps and rando utilities

" Strip trailing empty newlines https://stackoverflow.com/a/45316845/13315047
" ==================
function kp#trimTrailingEmpty()
	let lastLine = line('$')
	let lastNonblankLine = prevnonblank(lastLine)
	if lastLine > 0 && lastNonblankLine != lastLine
		silent! execute lastNonblankLine + 1 . ',$delete _'
	endif
endfunction


" pad lines above or below cursor; uses the same key combo in normal and insert modes
" ==============
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

" search engine using tantivy (rust)
" ==============
function! kp#searchr(index, ...)
	let l:query = join(a:000, ' ')
	if a:index == "all"
		let l:which_index = '-a'
	else
		let l:which_index = '-i ' . a:index
	endif
	let l:cmd = 'searchr ' . l:which_index . " search -l 15 " . l:query . ""
	let l:files = split(system(l:cmd), "\n")
	let l:qffiles = []
	for f in l:files
		call add(l:qffiles, {'filename': f})
	endfor
	call setqflist(l:qffiles)
	copen
	cc
endfunction


" pipe output from ex command to new tab
" ==============
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


" pipe output from ex command to split
" ==============
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


" rg pipe to fzf for post processing
" ==============
function! kp#RipgrepFzf(query, fullscreen) abort
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


" maximize the active window
" ==============
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


" add hourly timestamp to journal entries
" =================
function! kp#Stamp()
	silent! let l:stamp = strftime("|%H:00|")
	let l:res = 0
	exe "g/" . l:stamp . "/let l:res = l:res+1"
	if (l:res == 0)
		normal Go
		exe "normal 80i-\<Esc>"
		$pu=l:stamp
		normal G
		right 80
		call kp#padBelow()
		normal G
		" exe "normal o\<Esc>d0"
		left
		" call kp#padAbove()
		normal o
	else
		normal Go
	endif
endfunction

" exe "normal o \<C-O>d0"
" exe "normal 80i-\<Esc>"



" ----------
" Save the current search and cursor position
" let _s=@/
" let l = line('.')
" let c = col('.')

" Restore the saved search and cursor position
" let @/=_s
" call cursor(l, c)
" silent execute ':' . a:line2 . 's/' . l:space_pat . '//e'

" {{{ right align keyword
" for the line under the cursor, right align the final keyword string object
" at textwidth column. kludge for anchored text links within any file so i
" can jump around a file using a makeshift TOC with '%'.
" this hack is both over complicated and too simple, and I use it constantly.
" function! kp#rightAlignEndword() abort
"	let line = getline(".")
"	let [header, link] = split(line, '^\s*.*\%(\k?\|\s\)\+\zs\s*')
"	let header = substitute(header, '^\_s*\|\_s*$', '', 'g')
"	let remainder = (&l:textwidth) - len(header) - len(link)
"	let line = header.repeat(' ', remainder).link
"	call setline(".", line)
"	return
" endfunction
"}}}
