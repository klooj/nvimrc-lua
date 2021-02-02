local global = require('domain.global')
local pbind = require('publibs.plbind')
local vim = vim
local options = setmetatable({}, { __index = { global_local = {},window_local = {} } })

function options:load_options()
  self.global_local = {
    termguicolors  = true;
    mouse          = "nv";
    errorbells     = true;
    visualbell     = true;
    -- belloff        = 'all'
    hidden         = true;
    fileformats    = "unix,mac,dos";
    magic          = true;
    virtualedit    = "block";
    encoding       = "utf-8";
    fileencoding   = "utf-8";
    viewoptions    = "folds,cursor,curdir";
    sessionoptions = "curdir,help,tabpages,winsize";
    clipboard      = "unnamedplus";
    wildignorecase = true;
    wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,*.zwc*";
    wildmode       = "longest,list:full";
    undofile       = true;
    -- noswapfile       = true; need to experiment a little first
    swapfile       = true;
    directory      = global.cache_dir .. "swag/";   -- for swap file
    undodir        = global.cache_dir .. "undodir/";
    backupdir      = global.cache_dir .. "backup/";
    viewdir        = global.cache_dir .. "view/";
    spellfile      = global.cache_dir .. "spell/en.uft-8.add";
    history        = 2000;
    shada          = "!,'1000,f1,<200,:500,@500,s10,h";
    backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
    smarttab       = true;
    shiftround     = true;
    timeout        = true;
    ttimeout       = true;
    timeoutlen     = 350;
    ttimeoutlen    = 10;
    updatetime     = 100;
    redrawtime     = 1500;
    ignorecase     = true;
    smartcase      = true;
    infercase      = true;
    incsearch      = true;
    wrapscan       = true;
    complete       = ".,w,b,k,t";
    inccommand     = "split";
    grepformat     = "%f:%l:%c:%m,%f:%l:%m";
    grepprg        = 'rg --hidden --vimgrep --smart-case --engine=auto --follow --no-heading --trim -- ';
    breakat        = [[\ \ ;:,!?]];
    -- startofline    = false;
    whichwrap      = "<,>,[,],~,b";
    splitbelow     = true;
    splitright     = true;
    switchbuf      = "useopen";
    backspace      = "indent,eol,start";
    diffopt        = "filler,closeoff,iwhite,internal,algorithm:patience";
    completeopt    = "menuone,noselect,noinsert";
    jumpoptions    = "stack";
    showmode       = false;
    shortmess      = "aoOTcF";
    scrolloff      = 3;
    sidescrolloff  = 3;
    foldlevelstart = 1;
    ruler          = false;
    -- list           = true;
    showtabline    = 2;
    winwidth       = 30;
    winminwidth    = 10;
    pumheight      = 15;
    helpheight     = 12;
    previewheight  = 12;
    -- noshowcmd        = true;
    cmdheight      = 2;
    cmdwinheight   = 5;
    equalalways    = false;
    laststatus     = 2;
    display        = "lastline";
    showbreak      = "↳  ";
    listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
    pumblend       = 20;
    winblend       = 20;
    maxmempattern  = 100000;
    -- showmatch      = true;
  }

  self.bw_local   = {
    synmaxcol      = 2500;
    formatoptions  = "1jnrql";
    textwidth      = 100;
    expandtab      = true;
    tabstop        = 2;
    shiftwidth     = 2;
    softtabstop    = -1;
    autoindent     = true;
    smartindent    = true;
    breakindent    = true;
    breakindentopt = "shift:-2,min:20";
    nowrap         = true;
    linebreak      = true;
    number         = true;
    relativenumber = true;
    colorcolumn    = "80";
    foldenable     = true;
    -- foldmethod     = "indent";
    -- foldmethod     = 'marker';
    foldmethod     = 'expr';
    foldexpr       = 'nvim_treesitter#foldexpr()';
    signcolumn     = "yes";
    cindent        = false;
    conceallevel   = 2;
    -- concealcursor  = "niv";
    -- cursorline     = true;
    iskeyword      = "@,48-57,_,192-255,-";
  }

  vim.g.python3_host_prog      = global.home .. ".pyenv/versions/neovim3.9/bin/python3"
  vim.g.loaded_python_provider = 0
  vim.g.node_host_prog         = global.xdg .. "nvm/versions/node/v14.15.1/bin/neovim-node-host"
  vim.g.ackprg                 = 'ag --vimgrep'
  vim.cmd[[set rtp+=/usr/local/opt/fzf,/usr/local/opt/fzy,/usr/local/opt/rg,/usr/local/opt/ag]]

  for name, value in pairs(self.global_local) do
    vim.o[name] = value
  end
  pbind.bind_option(self.bw_local)
end

return options
