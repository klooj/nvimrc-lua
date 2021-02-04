if has('win32')
  let s:os_sep = '\\'
else
  let s:os_sep = '/'
endif

function! tj#join_lines() abort
  if &filetype == 'vim'
    if getline(line('.') + 1) =~ '^\s*\\'
      let old_reg = getreg('/')
      normal! J
      set lazyredraw
      call nvim_input('v/\s<CR>"_d')
      call timer_start(100, {timer-> execute("call setreg('/', '" . old_reg . "')")})
      set nolazyredraw
      nohl
      return
    endif
  endif

  normal! J
endfunction

function! tj#dict_to_formatted_json(dict) abort
  if type(a:dict) != v:t_dict
    return
  endif

  call std#window#temp({'buftype': 'nofile', 'filetype': 'json', 'vertical': v:true})

  let l:buffer_number = nvim_buf_get_number(0)

  call nvim_buf_set_lines(l:buffer_number, 0, -1, 1, std#json#format(tj#json_encode(a:dict)))

  silent! call dictwatcherdel(a:dict, '*', 's:dict_watcher_func')

  function! s:dict_watcher_func(d, k, z) abort closure
    call nvim_buf_set_lines(l:buffer_number, 1, -1, 1, std#json#format(tj#json_encode(a:d)))
  endfunction

  call dictwatcheradd(a:dict, '*', function('s:dict_watcher_func'))
endfunction
