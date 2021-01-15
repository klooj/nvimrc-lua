local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      disable_commands = true,
      max_jobs = 50,
    })
  end

  local use = packer.use
  packer.reset()

  --    === apparatuses ===
  use {'nvim-lua/popup.nvim', {'nvim-lua/plenary.nvim', config = 'require("klooj.plenary")'}}
  use {{'liuchengxu/vim-which-key', config = 'require("klooj.whichKey")'}, 'romainl/vim-qf'}
  use {{'wbthomason/packer.nvim', opt = true}, {'neomake/neomake', cmd = 'Neomake'}}
  use {'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle', config = 'require("ploog.nvtree")'}
  -- use {'lervag/wiki.vim', config = 'require("ploog.wiki")'}

  --    === SCOUR ===
  use {{'rhysd/clever-f.vim', config = 'require("ploog.cleverf")'}, 'junegunn/fzf.vim'}
  use {'pechorin/any-jump.vim', config = 'require("ploog.anyjump")'}
  use {'nvim-lua/telescope.nvim', config = 'require("klooj.telescope")', requires =
  {'nvim-telescope/telescope-fzy-native.nvim', 'nvim-telescope/telescope-github.nvim',
  'nvim-telescope/telescope-symbols.nvim', 'nvim-telescope/telescope-fzf-writer.nvim',
  {'brooth/far.vim', config = 'require("ploog.far")'}}}

  --    === ui accoutrement ===
  use {'kyazdani42/nvim-web-devicons', 'junegunn/vim-peekaboo', 'kshenoy/vim-signature', 'psliwka/vim-smoothie'}
  use {'norcalli/nvim-colorizer.lua', config = 'require("colorizer").setup()'}
  use {'glepnir/indent-guides.nvim', config = 'require("ploog.indentGuide")'}

  -- |> theme
  use {'tjdevries/colorbuddy.vim', {'glepnir/galaxyline.nvim', config = 'require("mood.vendiline")'},
    {'romgrk/barbar.nvim', config = 'require("mood.barbar").darkish()'}}
  use {{'romgrk/doom-one.vim', opt = true}, {'christianchiarulli/nvcode-color-schemes.vim', opt = true}}
  use {{'ishan9299/modus-theme-vim', opt = true}, {'glepnir/zephyr-nvim', opt = true, config = 'require("zephyr")'}}
  -- for working out wolf_line
  -- use {'tjdevries/colorbuddy.vim', 'glepnir/galaxyline.nvim',
  -- , config = 'require("mood.wolf_line")'},
  -- use {{'ishan9299/modus-theme-vim', opt = true, config = require("colorbuddy").colorscheme("modus-vivendi")},
    -- {'glepnir/zephyr-nvim', opt = true, config = 'require("zephyr")'}}


  --   === treating text like objects ===
  use {'godlygeek/tabular', 'tpope/vim-surround', 'tpope/vim-repeat'}
  use {{'tpope/vim-commentary', event = 'UIEnter *'}, {'monaqa/dial.nvim', event = 'UIEnter *'}}
  use {'Raimondi/delimitMate', config = 'require("ploog.delimit")', event = 'InsertEnter *'}
  use {'ntpeters/vim-better-whitespace', event = 'InsertLeavePre *', config = 'require("ploog.whitespace")'}
  use {'AndrewRadev/sideways.vim', cmd = {'SidewaysLeft', 'SidewaysRight'}}
  use {'gyim/vim-boxdraw', opt = true}


  --   === git ===
  use {{'tpope/vim-fugitive', requires = 'tpope/vim-rhubarb'}, {'mhinz/vim-signify'}}
  use {{'junegunn/gv.vim', cmd = 'GV'}, {'will133/vim-dirdiff', cmd = 'DirDiff',
  config = vim.cmd[[ let g:DirDiffExcludes = ".netrwhist, CVS,*.class,*.exe,*.swp,*.git,git*,*.DS_Store" ]]}}
  -- <https://github.com/stsewd/fzf-checkout.vim>


  --   === setup, startup, session ===
  use {'tpope/vim-eunuch', 'tpope/vim-obsession', {'dhruvasagar/vim-prosession', cmd = 'Prosession'}}
  use {'mbbill/undotree', cmd = 'UndotreeToggle', config = 'require("ploog.undotree")'}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}


  --   ===  treesitter, completion, snippets, etc  ===
  use {'nvim-treesitter/nvim-treesitter', config = 'require("klooj.treesitter")', run = ':TSUpdate',
  requires = {'nvim-treesitter/nvim-treesitter-refactor', 'p00f/nvim-ts-rainbow',
  'nvim-treesitter/nvim-treesitter-textobjects'}, {'nvim-treesitter/playground',
  cmd = 'TSPlaygroundToggle', config = 'require("klooj.tsPlayground")'}}

  use {'nvim-lua/completion-nvim', event = 'InsertEnter *', config = function()
    vim.cmd [[ augroup comps ]]
    vim.cmd [[ au BufEnter * if &buftype != "nofile" | lua require'completion'.on_attach() ]]
    vim.cmd [[ augroup END ]]
    require('klooj.completion')
    require('completion').on_attach()
    vim.cmd [[ doautoall FileType ]]
  end, requires = {{'norcalli/snippets.nvim', config = 'require("snippets").use_suggested_mappings()'},
  {'aca/completion-tabnine', opt = true }}}
  -- for fixing the completion in prompt issue
    -- vim.cmd [[au BufEnter * if &filetype !='TelescopePrompt' | lua require('klooj.completion').imply() ]]
  -- use 'nvim-treesitter/completion-treesitter'

  use {'neovim/nvim-lspconfig', config = 'require("klooj.lsp_config")',
    requires = {'tjdevries/nlua.nvim', 'nvim-lua/lsp-status.nvim'}}


  --   === debug ===
  use 'tpope/vim-scriptease'
  use {{'dstein64/vim-startuptime', cmd = 'StartupTime'}, {'bfredl/nvim-luadev', opt = true}}
  use {'puremourning/vimspector', opt = true, requires = 'nvim-telescope/telescope-vimspector.nvim'}


  -- === filetype/syntax specific ===
  use 'justinmk/vim-syntax-extra'
  use {'euclidianAce/BetterLua.vim', {'tjdevries/manillua.nvim', ft = {'lua'}}}
  use {'pearofducks/ansible-vim', config = 'require("ploog.ansible")'}
  use {'Glench/Vim-Jinja2-Syntax', ft = {'html', 'jinja', 'yaml'}}
  use {'cespare/vim-toml', ft = {'toml'}}
  -- use {{'elzr/vim-json', ft = {'json'}}, {'prettier/vim-prettier',
  -- ft = {'javascript', 'typescript', 'less', 'scss', 'css', 'json', 'graphql', 'markdown'}}}

  -- |> markdown
  use {'plasticboy/vim-markdown', ft = {'markdown'}, requires = 'reedes/vim-pencil' }
  use 'klooj/vim-checkbox'

  -- |>  python
  use {'psf/black', ft = {'python'}, requires = {'tjdevries/py_package.nvim', 'tjdevries/apyrori.nvim'}}

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

---------------------------


--[[
'andymass/vim-matchup'
'chaoren/vim-wordmotion''
'junegunn/vim-easy-align',
'justinmk/vim-dirvish'
'kristijanhusak/vim-dirvish-git'
'machakann/vim-sandwich'             -- replacement for surround, eh
'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ'
'mattn/vim-sonictemplate'
'nvim-lua/lsp_extensions.nvim',
'Olical/vim-enmasse'
'rhysd/vim-clang-format', opt = true, rocks = {'lua-cjson', 'lpeg', 'asdf'}
'romgrk/nvim-treesitter-context'
'steelsojka/completion-buffers'
'tjdevries/express_line.nvim', opt = true
'tjdevries/gruvbuddy.nvim', opt = true
'tjdevries/vim-inyoface',
'tpope/vim-abolish'                   -- search, substitute, or abbreviate words variants
'tpope/vim-sexp-mappings-for-regular-people'
'wellle/targets.vim'
'justinmk/vim-sneak',
'airblade/vim-rooter', config = 'require("klooj.rooter")'}
'mharington/formatter.nvim', cmd = 'Format', config = 'require("klooj.formatter")'}
'AndrewRadev/splitjoin.vim', 'preservim/nerdcommenter',
use {'mfussenegger/nvim-dap', opt = true, requires = {'theHamsta/nvim-dap-virtual-text',
'mfussenegger/nvim-dap-python', 'nvim-telescope/telescope-dap.nvim'}}
use {'tjdevries/conf.vim', opt = true, requires = {'tjdevries/standard.vim','skywind3000/quickmenu.vim'}}
use {'voldikss/vim-floaterm', opt = true, config = 'require("ploog.floaterm")',
requires = 'voldikss/fzf-floaterm'}

]]
