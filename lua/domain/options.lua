local global = require('domain.global')
local pbind = require('poob.plbind')
local options = setmetatable({}, { __index = { global_local = {},window_local = {} } })


function options:load_options()
  vim.g.loaded_python_provider = 0
  vim.g.python3_host_prog      = global.py3
  vim.g.node_host_prog         = global.npm
  vim.g.ackprg                 = 'ag --vimgrep'

  vim.cmd[[set rtp+=/usr/local/opt/fzf,/usr/local/opt/fzy,/usr/local/opt/fd,/usr/local/opt/rg,/usr/local/opt/ag]]

  self.global_local = {
    -- belloff        = 'all'
    -- list           = true;
    -- noshowcmd        = true;
    -- noswapfile       = true; need to experiment a little first
    -- startofline    = false;
    -- tags           += '$XDG_CACHE_HOME/tags/**/tags';
    backspace      = "indent,eol,start";
    backupdir      = global.cache_dir .. "backup/";
    backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
    breakat        = [[\ \ ;:,!?]];
    clipboard      = "unnamedplus";
    cmdheight      = 2;
    cmdwinheight   = 7;
    complete       = ".,w,b,k,t";
    completeopt    = "menuone,noselect"; -- noinsert
    diffopt        = "filler,closeoff,iwhite,internal,algorithm:patience";
    directory      = global.cache_dir .. "swag/";   -- for swap file
    display        = "lastline";
    encoding       = "utf-8";
    equalalways    = false;
    errorbells     = true;
    fileencoding   = "utf-8";
    fileformats    = "unix,mac,dos";
    -- foldlevelstart = 2;
    grepformat     = "%f:%l:%c:%m,%f:%l:%m";
    grepprg        = 'rg --hidden --vimgrep --smart-case --engine=auto --follow --no-heading --trim -- ';
    guifont        = 'FiraCode Nerd Font',
    helpheight     = 12;
    hidden         = true;
    history        = 2000;
    ignorecase     = true;
    inccommand     = "split";
    incsearch      = true;
    infercase      = true;
    jumpoptions    = "stack";
    laststatus     = 2;
    listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
    magic          = true;
    maxmempattern  = 100000;
    mouse          = "nv";
    previewheight  = 12;
    pumblend       = 30;
    pumheight      = 15;
    redrawtime     = 1500;
    ruler          = false;
    scrolloff      = 3;
    sessionoptions = "curdir,help,tabpages,winsize";
    shada          = "!,'1000,f1,<200,:500,@500,s10,h";
    shiftround     = true;
    shortmess      = "aoOTcF";
    showbreak      = "↳  ";
    showmatch      = true;
    showmode       = false;
    showtabline    = 2;
    sidescrolloff  = 3;
    smartcase      = true;
    smarttab       = true;
    spellfile      = global.foonv .. "spell/en.utf-8.add";
    splitbelow     = true;
    splitright     = true;
    swapfile       = true;
    switchbuf      = "useopen";
    tagcase        = 'followscs';
    tagrelative    = false;
    termguicolors  = true;
    timeout        = true;
    timeoutlen     = 350;
    ttimeout       = true;
    ttimeoutlen    = 10;
    undodir        = global.cache_dir .. "undodir/";
    undofile       = true;
    updatetime     = 100;
    viewdir        = global.cache_dir .. "view/";
    viewoptions    = "folds,cursor,curdir";
    virtualedit    = "block";
    visualbell     = true;
    whichwrap      = "<,>,[,],~,b";
    wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,*.zwc*";
    wildignorecase = true;
    wildmode       = "longest,list:full";
    winblend       = 30;
    winminwidth    = 10;
    winwidth       = 35;
    wrapscan       = true;
  }

  self.bw_local   = {
    -- concealcursor  = "niv";
    autoindent     = true;
    breakindent    = true;
    breakindentopt = "shift:-2,min:20";
    cindent        = false;
    colorcolumn    = "80";
    conceallevel   = 2;
    cursorline     = true;
    eol            = true;
    fixeol         = true;
    nofoldenable   = true;
    -- foldenable     = false;
    -- foldexpr      = 'nvim_treesitter#foldexpr()';
    -- foldmethod    = 'expr';
    foldmethod     = 'indent';
    formatoptions  = "1jnrl";
    iskeyword      = "@,48-57,_,192-255,-";
    linebreak      = true;
    expandtab      = true;
    nowrap         = true;
    number         = true;
    relativenumber = true;
    shiftwidth     = 3;
    signcolumn     = 'yes:2';
    smartindent    = true;
    softtabstop    = -1;
    synmaxcol      = 2500;
    tabstop        = 3;
    textwidth      = 100;
  }

  for name, value in pairs(self.global_local) do
    vim.o[name] = value
  end
  pbind.bind_option(self.bw_local)
end

return options
