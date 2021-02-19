let g:ansible_goto_role_paths = './roles,../_common/roles'
function! FindAnsibleRoleUnderCursor()
   if exists("g:ansible_goto_role_paths")
      let l:role_paths = g:ansible_goto_role_paths
   else
      let l:role_paths = "./roles"
   endif
   let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
   let l:found_role_path = findfile(l:tasks_main, l:role_paths)
   if l:found_role_path == ""
      echo l:tasks_main . " not found"
   else
      execute "edit " . fnameescape(l:found_role_path)
   endif
endfunction

nnoremap <buffer> <localleader><CR> :call FindAnsibleRoleUnderCursor()<CR>
vnoremap <buffer> <localleader><CR> :call FindAnsibleRoleUnderCursor()<CR>

" let g:loaded_compe_ultisnips = 0
" let g:compe.source.ultisnips = v:true
