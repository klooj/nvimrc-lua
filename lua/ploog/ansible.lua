local opts = {
  unindent_after_newline = 1,
  attribute_highlight = "b",
  name_highlight = 'd',
  extra_keywords_highlight = 1,
  goto_role_paths = {'./roles', '../_common/roles'},
}

VG("ansible_", opts)

------------------------
-- started but got interrupted: gf for ansible files to roles, etc

-- local gbl = require('domain.global')
-- local role_paths = {'./roles', '../_common/roles', gbl.home .. "ansible/roles" }
-- function ansigf()
  -- local tasks_main = vim.cmd[[expand("<cfile>") . "/tasks/main.yml"]]
  -- local found_role_path = vim.cmd[[findfile(l:tasks_main, l:role_paths)]]


-- end
-- " vim-plug example
-- call plug#begin('~/.vim/plugged')
-- Plug 'pearofducks/ansible-vim'
-- call plug#end()

-- let g:ansible_goto_role_paths = './roles,../_common/roles'

-- function! FindAnsibleRoleUnderCursor()
--   if exists("g:ansible_goto_role_paths")
--     let l:role_paths = g:ansible_goto_role_paths
--   else
--     let l:role_paths = "./roles"
--   endif
--   let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
--   let l:found_role_path = findfile(l:tasks_main, l:role_paths)
--   if l:found_role_path == ""
--     echo l:tasks_main . " not found"
--   else
--     execute "edit " . fnameescape(l:found_role_path)
--   endif
-- endfunction

-- au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
-- au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
-- for k,v in pairs(opts) do
  -- vg[.. k] = v
-- end
