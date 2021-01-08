
To check LSP clients attached to current buffer:  
  `lua print(vim.inspect(vim.lsp.buf_get_clients()))`  

Location of log file:  
 `lua print(vim.lsp.get_log_path())`

to overwrite some function in a plugin:
`require'some_plugin.module'.some_func = function() ... end`

## install sumneko lua server

cd ~/gits; git clone <https://github.com/sumneko/lua-language-server>; cd lua-language-server
git submodule update --init --recursive; cd 3rd/luamake
    * either/or:
ninja -f ninja/macos.ninja; cd ../..; ./3rd/luamake/luamake rebuild
ninja -f ninja/linux.ninja; cd ../..; ./3rd/luamake/luamake rebuild


## lua notes

    - for booleans, only `false` and `nil` are falsey. `0` is treated as integer
    - if clauses
   '~''=' means not equal to
    - tables are hashed dicts
        * iteration

```lua
  u = {[me] = 'sup', [you] = 'hey', [4] = 'yo'}
  for key, val in pairs(u) do
    print(key, val)
  end
```

    * _G is a special table of all globals.
  `print(_G['_G'] == _G)`  -- Prints 'true'

-- showhighlighting groups
    -- ["n|<F1>"]    = map_cr([[echo synIDattr(synID(line('.'), col('.'), 0), 'name')]]):with_noremap():with_silent(),
    -- ["n|<F2>"]    = map_cr([[echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")]]):with_noremap():with_silent(),
    -- ["n|<F3>"]    = map_cr([[echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')]]):with_noremap():with_silent(),
    -- ["n|<F4>"]    = map_cr([[exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')]]):with_noremap():with_silent(),
