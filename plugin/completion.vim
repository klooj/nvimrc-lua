" let g:completion_enable_auto_paren = 0
" let g:completion_auto_change_source = 1
" let g:completion_enable_auto_hover = 1
" let g:completion_enable_auto_popup = 1
" let g:completion_enable_snippet = 'snippets.nvim'
" let g:completion_matching_ignore_case = 1
" let g:completion_matching_smart_case = 1
" let g:completion_matching_strategy_list = ['exact']
" let g:completion_tabnine_max_num_results = 3
" let g:completion_tabnine_priority = 1
" let g:completion_tabnine_sort_by_details = 1
" let g:completion_tabnine_tabnine_path = expand("$HOME/.local/share/t9/3.2.28/TabNine")
" let g:completion_trigger_keyword_length = 2
" let g:completion_trigger_on_delete = 0

" let g:completion_chain_complete_list = {
"       \ 'default': [
"       \   {'complete_items': ['tabnine', 'path', 'snippet', 'lsp']},
"       \   {'mode'          : '<c-p>'},
"       \   {'mode'          : '<c-n>'}
"       \]
"       \}

" "       " \   {'complete_items': ['path', "lsp", 'snippet']},
" " " imap <C-,> <Plug>(completion_next_source)
" " " imap <C-.> <Plug>(completion_prev_source)
" " " let g:completion_timer_cycle=150  " default 80
" " " let g:completion_tabnine_max_lines = 1000
" "   " vim.api.nvim_buf_set_keymap('0', 'n', '<C-,>', '<Plug>(completion_next_source)', {noremap = true})
" "   " vim.api.nvim_buf_set_keymap('0', 'i', '<C-,>', '<Plug>(completion_next_source)', {noremap = true})
" "   " vim.api.nvim_buf_set_keymap('0', 'n', '<C-.>', '<Plug>(completion_prev_source)', {noremap = true})
" "   " vim.api.nvim_buf_set_keymap('0', 'i', '<C-.>', '<C-O><Plug>(completion_prev_source)', {noremap = true})
