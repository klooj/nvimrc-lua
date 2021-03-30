-- map  cr (":%s<CR>")
-- map cu (":<C-u>%s<CR>")


-- normal:leader
local maps = {
  [','] = {':Commentary<CR>', 'comment'},
  [';'] = {":%s:::g<Left><Left><Left>", 'sub global'},
  ['.'] = {':vsplit $FOONV/init.lua<CR>',  'vimrc'},
  ['<Leader>\\'] = {':NvimTreeToggle<CR>', 'nv tree'},
  ['<Leader>='] = {'<C-W>=', 'balance windows'},
  ['<Leader><Left>']  = {':BufferMoveNext<CR>', 'mv buf next'},
  ['<Leader><Right>']  = {':BufferMovePrevious<CR>', 'mv buf prev'},
  a = {
    name = '+actions',
    ['#'] = {':py3 import vim, random; vim.current.line += str(random.randint(0,9))<CR><esc>A', 'rand num'},
    a = {
      name = '+init lazy pack',
      b = {':packadd vim-boxdraw<CR>', 'box draw'},
      d = {':source $FOONV/lazy/dap.vim<CR>', 'dap'},
      v = {':source $FOONV/lazy/vimspector.vim<CR>', 'vimspector'},
    },
    c = {":ColorizerToggle<CR>", 'colorizer'},
    h = {":Helptags<CR>", "search helptags"},
    p = {
      name = '+packer',
      c = {':PackerClean<CR>', 'clean'},
      i = {':PackerInstall<CR>', 'install'},
      p = {':PackerCompile<CR>', 'compile'},
      s = {':PackerSync<CR>', 'sync'},
      u = {':PackerUpdate<CR>', 'update'},
    },
    u = {':UndotreeToggle<CR>', 'undo tree'},
    w = {':StripWhitespace<CR>', 'trailing spaces'},
  },
  b = {
    name = '+buffer',
    b = {'set scrollbind', 'bind scroll'},
    -- c = {':<CR>',},
    -- d = {':<CR>',},
    d = {'BufferDelete:<CR>', 'delete'},
    h = {'<C-W>t<C-W>K', 'arrange:horizontal'},
    o = {
      name = '+options',
      c = {':set cursorcolumn<CR>', 'hl cursor col' },
      C = {':set nocursorcolumn<CR>', 'hide cursor col' },
      w = {':hi ColorColumn ctermbg=202020 guibg=202020<CR>', "tw col grey" },
      W = {':hi ColorColumn ctermbg=darkcyan guibg=darkcyan<CR>', 'tw col cyan'},
      N = {':set nonumber!<CR>', 'hide line numbers' },
      n = {':set number!<CR>', 'show line numbers'},
    },
    O = {':BufferOrderByDirectory<CR>', 'order:dir'},
    R = {':BufferCloseBuffersRight<CR>', 'close:right:all'},
    s = {':call WindowSwap#EasyWindowSwap()<CR>', 'window swap'},
    v = {'<C-W>t<C-W>H', 'arrange:vertical'},
    w = {':BufferWipeout<CR>', 'wipeout'},
    X = {':BufferCloseAllButCurrent<CR>', 'close:inactive:all'},
    x = {'BufferClose:<CR>', 'close'},
  },
  d = {
    name = '+debug/lsp',
    ['?'] = {':lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>', 'LSP info'},
    M = {':Neomake<CR>', 'neomake'},
    d = {
      name = '+repl',
      o = {':Luadev', 'open repl'},
      -- l = {},
      -- v = {},
      -- w = {},
    },
  },
  e = {
    name = 'edit+',
    [';'] = 'open last jump file' ,
    c = {':vsplit $FOONV/lua/ploog/completion.lua<CR>', 'completions'},
    e = {':Telescope symbols<CR>', 'insert emojis'},
    k = {':vsplit $FOONV/lua/domain/keymaps.lua<CR>', 'keymaps'},
    L = {':vsplit $FOONV/lua/ploog/lsp_config.lua<CR>', 'lsp_config'},
    p = {':vsplit $FOONV/lua/domain/plugins.lua<CR>', 'lua plugins'},
    t = {':vsplit ~/Desktop/info/todo.md<CR>', 'todo'},
    w = {':vsplit $FOONV/lua/plugin/whichKey.lua<CR>', 'which-key maps'},
  },
  g = {
    name = '+git',
    a = {':Git add .<CR>', 'add all'},
    b = {':GBrowse<CR>', 'browse'},
    c = {':Gcommit<CR>', 'commit'},
    d = {':Gdiffsplit!<CR>', 'diff current file'},
    h = {
      name = '+hunk' ,
      b = {":lua require'gitsigns'.blame_line()<CR>", 'blame line'},
      p = {":lua require'gitsigns'.preview_hunk()<CR>", 'preview hunk'},
      r = {":lua require'gitsigns'.reset_hunk()<CR>", 'reset hunk'},
      s = {":lua require'gitsigns'.stage_hunk()<CR>", 'stage hunk'},
      u = {":lua require'gitsigns'.undo_stage_hunk()<CR>", 'undo stage hunk'} ,
    },
    f = {':diffget //2<CR>', 'diff get left'},
    j = {':diffget //3<CR>', 'diff get right'},
    l = {':Git log<CR>', 'log'},
    m = {':Git mergetool<CR>', 'merge tool'},
    p = {':Git Pull<CR>', 'pull'},
    P = {':Git Push<CR>', 'push'},
    s = {':Gstatus<CR>', 'status'},
    V = {':GV!<CR>', 'view buffer commits'},
    v = {':GV<CR>', 'view commits'},
  },
  h = {'<C-W>s', 'split below'}          ,
  H = {":echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>", 'ts highlight'} ,
  j = {':AnyJump<CR>', 'any jump'}             ,
  k = {':BufferPick<CR>', 'pick buffer'}          ,
  v = {'<C-W>v', 'split right'}          ,
  V = {':vertical wincmd f<CR>', 'vsplit open file'}     ,
  z = {':vsplit ~/.zshrc<CR>', 'edit zshrc'}           ,
}

-- visual:leader
local vmaps = {
  [','] = {"'<,'>Commentary", 'comment'},
  j = {':AnyJumpVisual<CR>', 'any jump'}             ,

  m = {
    name = '+3'
  }
}

local wk = require('whichkey_setup')
wk.register_keymap('leader', maps, {noremap = true, silent = true, bufnr = 0})
wk.register_keymap('visual', vmaps, {noremap = true, silent = true, bufnr = 0})
