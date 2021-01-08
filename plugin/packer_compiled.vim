" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["Vim-Jinja2-Syntax"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax"
  },
  ["ansible-vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/ansible-vim"
  },
  ["any-jump.vim"] = {
    config = { 'require("ploog.anyjump")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/any-jump.vim"
  },
  black = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/black"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\nŠ\2\0\0\3\0\n\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0016\0\5\0'\2\a\0B\0\2\0029\0\b\0B\0\1\0016\0\0\0009\0\1\0'\2\t\0B\0\2\1K\0\1\0\25 doautoall FileType \14on_attach\15completion\21klooj.completion\frequire\18 augroup END : au BufEnter * lua require('completion').on_attach() \20 augroup comps \bcmd\bvim\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/completion-nvim"
  },
  ["completion-tabnine"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/completion-tabnine"
  },
  delimitMate = {
    config = { 'require("ploog.delimit")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/delimitMate"
  },
  ["dial.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/dial.nvim"
  },
  ["doom-one.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/doom-one.vim"
  },
  ["gv.vim"] = {
    commands = { "GV" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/gv.vim"
  },
  ["manillua.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/manillua.nvim"
  },
  ["modus-theme-vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/modus-theme-vim"
  },
  neomake = {
    commands = { "Neomake" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/neomake"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim"
  },
  ["nvim-luadev"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/nvim-luadev"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { 'require("ploog.nvtree")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle" },
    config = { 'require("klooj.tsPlayground")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["sideways.vim"] = {
    commands = { "SidewaysLeft", "SidewaysRight" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/sideways.vim"
  },
  ["telescope-vimspector.nvim"] = {
    load_after = {
      vimspector = true
    },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/telescope-vimspector.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { 'require("ploog.undotree")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-better-whitespace"] = {
    config = { 'require("ploog.whitespace")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace"
  },
  ["vim-commentary"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-dirdiff"] = {
    commands = { "DirDiff" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-dirdiff"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-markdown"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-peekaboo"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-peekaboo"
  },
  ["vim-prosession"] = {
    commands = { "Prosession" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-prosession"
  },
  ["vim-radical"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-radical"
  },
  ["vim-signature"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-signature"
  },
  ["vim-signify"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-signify"
  },
  ["vim-smoothie"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-smoothie"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-toml"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  vimspector = {
    after = { "telescope-vimspector.nvim" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  ["zephyr-nvim"] = {
    config = { 'require("zephyr")' },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/kmcgills/.local/share/nvim/site/pack/packer/opt/zephyr-nvim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: indent-guides.nvim
require("ploog.indentGuide")
-- Config for: far.vim
require("ploog.far")
-- Config for: galaxyline.nvim
require("mood.vendiline")
-- Config for: snippets.nvim
require("klooj.snippets")
-- Config for: barbar.nvim
require("mood.barbar").darkish()
-- Config for: plenary.nvim
require("klooj.plenary")
-- Config for: nvim-lspconfig
require("klooj.lsp_config")
-- Config for: telescope.nvim
require("klooj.telescope")
-- Config for: nvim-colorizer.lua
require("colorizer").setup()
-- Config for: clever-f.vim
require("ploog.cleverf")
-- Config for: vim-which-key
require("klooj.whichKey")
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Neomake call s:load(['neomake'], { "cmd": "Neomake", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Prosession call s:load(['vim-prosession'], { "cmd": "Prosession", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file TSPlaygroundToggle call s:load(['playground'], { "cmd": "TSPlaygroundToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file DirDiff call s:load(['vim-dirdiff'], { "cmd": "DirDiff", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file SidewaysLeft call s:load(['sideways.vim'], { "cmd": "SidewaysLeft", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file GV call s:load(['gv.vim'], { "cmd": "GV", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file NvimTreeToggle call s:load(['nvim-tree.lua'], { "cmd": "NvimTreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Make call s:load(['vim-dispatch'], { "cmd": "Make", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Focus call s:load(['vim-dispatch'], { "cmd": "Focus", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Start call s:load(['vim-dispatch'], { "cmd": "Start", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Dispatch call s:load(['vim-dispatch'], { "cmd": "Dispatch", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file StartupTime call s:load(['vim-startuptime'], { "cmd": "StartupTime", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file SidewaysRight call s:load(['sideways.vim'], { "cmd": "SidewaysRight", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType toml ++once call s:load(['vim-toml'], { "ft": "toml" })
  au FileType python ++once call s:load(['black'], { "ft": "python" })
  au FileType markdown ++once call s:load(['vim-markdown'], { "ft": "markdown" })
  au FileType html ++once call s:load(['Vim-Jinja2-Syntax'], { "ft": "html" })
  au FileType lua ++once call s:load(['manillua.nvim'], { "ft": "lua" })
  au FileType yaml ++once call s:load(['Vim-Jinja2-Syntax', 'ansible-vim'], { "ft": "yaml" })
  au FileType jinja ++once call s:load(['Vim-Jinja2-Syntax'], { "ft": "jinja" })
  " Event lazy-loads
  au InsertEnter * ++once call s:load(['completion-nvim', 'delimitMate'], { "event": "InsertEnter *" })
  au VimEnter * ++once call s:load(['vim-signify'], { "event": "VimEnter *" })
  au InsertLeavePre * ++once call s:load(['vim-better-whitespace'], { "event": "InsertLeavePre *" })
  au UIEnter * ++once call s:load(['dial.nvim', 'vim-peekaboo', 'vim-signature', 'vim-smoothie', 'vim-commentary', 'any-jump.vim'], { "event": "UIEnter *" })
augroup END
