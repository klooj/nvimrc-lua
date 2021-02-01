local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      disable_commands = true,
      max_jobs = 45,
    })
  end
  local use = packer.use
  packer.reset()
  -- === no extra config and load on startup ===
  use {
    'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'junegunn/vim-peekaboo',
    'kshenoy/vim-signature', 'romainl/vim-qf', 'junegunn/fzf.vim', 'godlygeek/tabular',
    'tpope/vim-surround', 'tpope/vim-repeat', 'tpope/vim-commentary', 'tpope/vim-fugitive',
    'tpope/vim-rhubarb', 'mhinz/vim-signify', 'junegunn/gv.vim', 'tpope/vim-eunuch',
    'tpope/vim-scriptease', 'bfredl/nvim-luadev', 'monaqa/dial.nvim',
    'kyazdani42/nvim-web-devicons', 'psliwka/vim-smoothie', 'tjdevries/colorbuddy.vim'
  }

  --    === apparatuses ===
  use {'liuchengxu/vim-which-key', config = function() require('klooj.whichKey') end}
  use {'wbthomason/packer.nvim', opt = true}
  use {'lervag/wiki.vim', config = function() require("ploog.wiki") end}
  use {'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle', config = function() require('ploog.nvtree') end}
  -- {'neomake/neomake', cmd = 'Neomake'}}

  --    === SCOUR ===
  use {'rhysd/clever-f.vim', config = function() require('ploog.cleverf') end}
  use {'pechorin/any-jump.vim', config = function() require('ploog.anyjump') end}
  use {'nvim-lua/telescope.nvim', config = function() require('klooj.telescope') end, requires = {
    'nvim-telescope/telescope-fzy-native.nvim', 'nvim-telescope/telescope-github.nvim',
    'nvim-telescope/telescope-symbols.nvim', 'nvim-telescope/telescope-fzf-writer.nvim',
    {'brooth/far.vim', config = function() require('ploog.far') end},
    {'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim'}
  }}

  --   === treating text like objects ===
  use {'Raimondi/delimitMate', config = function() require('ploog.delimit') end, event = 'InsertEnter *'}
  use {'ntpeters/vim-better-whitespace', event = 'InsertLeavePre *', config = function() require('ploog.whitespace') end}
  use {'AndrewRadev/sideways.vim', cmd = {'SidewaysLeft', 'SidewaysRight'}}
  -- use {'gyim/vim-boxdraw', opt = true}

  --   === git ===
  -- use {'will133/vim-dirdiff', cmd = 'DirDiff',
    -- config = function()
      -- vim.cmd[[ let g:DirDiffExcludes = ".netrwhist, CVS,*.class,*.exe,*.swp,*.git,git*,*.DS_Store" ]]
    -- end}
  -- <https://github.com/stsewd/fzf-checkout.vim>

  --   === setup, startup, syntax, session ===
  use {'dhruvasagar/vim-prosession', cmd = 'Prosession',
    requires = {'tpope/vim-obsession', opt = true}, config = function() require('ploog.prosession') end}
  use {'mbbill/undotree', cmd = 'UndotreeToggle', config = function() require('ploog.undotree') end}
  use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  --   === debug ===
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
  use {'puremourning/vimspector', opt = true, requires = {'nvim-telescope/telescope-vimspector.nvim', opt = true}}

  --   ===  treesitter, ===
  use {'nvim-treesitter/nvim-treesitter', config = function() require('klooj.treesitter') end,
    requires = {'nvim-treesitter/nvim-treesitter-refactor', 'p00f/nvim-ts-rainbow',
      'nvim-treesitter/nvim-treesitter-textobjects', 'romgrk/nvim-treesitter-context'}}
  -- {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', config = 'require("klooj.tsPlayground")'}}

  -- === completion, lsp, & snippets ===
  use {'SirVer/ultisnips', requires = 'honza/vim-snippets', config = function() require('ploog.ultisnips') end}
  use {'neovim/nvim-lspconfig', config = function() require('klooj.lsp_config') end,
    requires = {'tjdevries/nlua.nvim', 'nvim-lua/lsp-status.nvim'}}
  use {'nvim-lua/completion-nvim', config = function() require('klooj.completion') end, requires = 'aca/completion-tabnine'}

  --    === ui accoutrement ===
  use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
  -- |> theme
  use {'glepnir/zephyr-nvim', config = function() require('colorbuddy').colorscheme('zephyr') end}
  use {
    {'ishan9299/modus-theme-vim', opt = true, config = function() require('colorbuddy').colorscheme('modus-vivendi') end},
    {'christianchiarulli/nvcode-color-schemes.vim', opt = true, config = function() require('colorbuddy').colorscheme('snazzy') end},
    {'romgrk/doom-one.vim', opt = true, config = function() require('colorbuddy').colorscheme('doom-one') end}}
  -- |> statusline & tabline
  use {'glepnir/galaxyline.nvim', config = function() require('mood.vendiline') end}
  use {'romgrk/barbar.nvim', config = function() require('mood.barbar') end}
  use {'glepnir/indent-guides.nvim', config = function() require('ploog.indentGuide') end}

  -- === filetype/syntax specific ===
  -- |> ansible
  use {'pearofducks/ansible-vim', config = function() require('ploog.ansible') end, ft = {'yaml', 'yaml.ansible', 'yml'}}
  use {'Glench/Vim-Jinja2-Syntax', ft = {'html', 'jinja', 'yaml', 'yaml.ansible'}}
  -- |>  R
  use {'jalvesaq/Nvim-R', ft = {'R'}}
  -- |>  python
  use {'psf/black', ft = {'python'}, requires = {'tjdevries/py_package.nvim', 'tjdevries/apyrori.nvim'}}
  -- |> markdown
  use {'SidOfc/mkdx', config = function() require('klooj.markdown') end}
  use {'reedes/vim-pencil', ft = {'markdown'}}
  use {'itspriddle/vim-marked', ft = {'markdown'}}
  use {'plasticboy/vim-markdown', ft = {'markdown'}}
  -- |> json
  use {'elzr/vim-json', ft = {'json'}}
  use {'prettier/vim-prettier', config = function() require('ploog.prettier') end,
    ft = {'javascript', 'typescript', 'less', 'scss', 'css', 'json', 'graphql', 'markdown'}}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

---------------------------

  -- use {'neoclide/coc.nvim', branch = 'release', ft = {'markdown'},
    -- config = 'vim.g.coc_global_extensions = {"coc-markdownlint", "coc-json"}'}

-- mess from before switching back to ultisnips:
-- use {'nvim-lua/completion-nvim', event = 'InsertEnter *', config = function()
--   vim.cmd [[ augroup comps ]]
--   vim.cmd [[ au BufRead,BufNewFile * if (&buftype != "prompt") && (&buftype != "nofile") | lua require'completion'.on_attach() ]]
--   vim.cmd [[ augroup END ]]
--   require('klooj.completion')
--   require('completion').on_attach()
--   vim.cmd [[ doautoall FileType ]]
-- end, requires = {
--   {'aca/completion-tabnine', after = 'completion-nvim'}
-- }}
-- use {'hrsh7th/vim-vsnip', requires = 'hrsh7th/vim-vsnip-integ', config = 'require("ploog.vsnip")'}
-- use {'SirVer/ultisnips', requires = 'honza/vim-snippets', config = 'require("ploog.ultisnips")'}
-- use {'norcalli/snippets.nvim', config = 'require("snippets").use_suggested_mappings()'}
-- use {'ojroques/nvim-lspfuzzy', config = 'require("lspfuzzy").setup{}}'

-- for fixing the completion in prompt issue
  -- vim.cmd [[au BufEnter * if &filetype !='TelescopePrompt' | lua require('klooj.completion').imply() ]]
-- use 'nvim-treesitter/completion-treesitter'


--[[
'cespare/vim-toml', ft = {'toml'}
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
