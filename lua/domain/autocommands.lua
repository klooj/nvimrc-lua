local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '.. group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end


function autocmd.load_autocmds()
  local definitions = {

    bufs = {
      -- reload vim on changes?
      -- {"BufWritePost",[[$VIM_PATH/{*.vim,vimrc} nested source $MYVIMRC | redraw]]};
      {"BufWritePost",[[$FOONV/lua/domain/plugins.lua PackerCompile]]};       -- recompile packer when plugins.lua is saved
      {"BufWritePre","/tmp/*","setlocal noundofile"};
      {"BufWritePre","COMMIT_EDITMSG","setlocal noundofile"};
      {"BufWritePre","MERGE_MSG","setlocal noundofile"};
      {"BufWritePre","*.tmp","setlocal noundofile"};
      {"BufWritePre","*.bak","setlocal noundofile"};
      {"BufRead","*","lua require('klooj.selfunc').enable_fold()"};
      -- {"BufWritePre","*.tsx","lua vim.api.nvim_command('Format')"};
    };

    wins = {
      {"VimResized", "*", [[tabdo wincmd =]]};        -- Equalize window dimensions when resizing vim window
      {"FocusGained", "*", "checktime"};              -- Check if file changed when its window is focus, more eager than 'autoread'
      {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]};       -- Force write shada on leaving nvim
      -- Highlight current line only on focused window
      {"WinEnter,BufEnter,InsertLeave", "*", [[if ! &cursorline && &filetype !~# '^(dashboard|start)' && ! &pvw | setlocal cursorline | endif]]};
      {"WinLeave,BufLeave,InsertEnter", "*", [[if &cursorline && &filetype !~# '^(dashboard|start)' && ! &pvw | setlocal nocursorline | endif]]};
      -- highlight todo, note, etc
      -- {"Syntax", [[* syn match extTodo "\<\(NOTE\|HACK\|BAD\|TODO\):\?" containedin=.*Comment.* | hi! extTodo guifg=red ctermfg=red]]};
      {"Syntax", [[* syn match extTodo "\<\(NOTE\|HACK\|BAD\|TODO\):\?" containedin=.*Comment.* | hi! link extTodo Todo]]};
    };

    ft = {
      {"BufRead,BufNewFile", "*.wiki", "setf markdown"};
      {"FileType", "json", "set filetype=jsonc"};
      {"FileType", "which_key", "set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler"}
    };

    yank = {
      {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]};
    };
    -- completions = {
      -- {"BufEnter", "*", "lua require'completion'.on_attach()"}
    -- };
    -- gitblame = {
    --   {"CursorHold","*","lua require'version'.blameVirtualText()"};
    --   {"CursorMoved,CursorMovedI","*","lua require'version'.clearBlameVirtualText()"};
    -- }
  }

  autocmd.nvim_create_augroups(definitions)
end

return autocmd


-- autocmd! FileType which_key
-- autocmd  FileType which_key set laststatus=0 noshowmode noruler
--       \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
-- {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"};
-- {"BufNewFile,BufRead","*.toml"," setf toml"},
