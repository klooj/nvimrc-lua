local g = require("domain.global")
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
  -- local use_rocks = packer.use_rocks
  packer.reset()

  -- === load on startup and either config in lua/plugin or none ===
  use {
    'lewis6991/gitsigns.nvim'      , 'tjdevries/astronauta.nvim'   ,
    'glepnir/dashboard-nvim'       , 'tjdevries/colorbuddy.nvim'   ,
    'glepnir/galaxyline.nvim'      , 'monaqa/dial.nvim'            , 'tpope/vim-abolish'         ,
    'glepnir/indent-guides.nvim'   , 'norcalli/nvim-colorizer.lua' , 'tpope/vim-commentary'      ,
    'godlygeek/tabular'            , 'nvim-lua/plenary.nvim'       , 'tpope/vim-eunuch'          ,
    'junegunn/fzf.vim'             , 'nvim-lua/popup.nvim'         , 'tpope/vim-fugitive'        ,
    'junegunn/vim-peekaboo'        , 'Raimondi/delimitMate'        , 'tpope/vim-repeat'          ,
    'klooj/vim-checkbox'           , 'rhysd/clever-f.vim'          , 'tpope/vim-scriptease'      ,
    'kshenoy/vim-signature'        , 'romainl/vim-qf'              , 'tpope/vim-surround'        ,
    'kyazdani42/nvim-web-devicons' , 'romgrk/barbar.nvim'          ,
  } -- 'AndrewRadev/splitjoin.vim'    ,'liuchengxu/vim-which-key'
  use {'norcalli/nvim-terminal.lua', config = [[require('terminal').setup()]] }
  --    === telescope ===
  use {'nvim-lua/telescope.nvim', config = function() require('klooj.telescope') end,
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim', 'brooth/far.vim',
      'nvim-telescope/telescope-github.nvim', 'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-fzf-writer.nvim', 'tami5/sql.nvim',
      'nvim-telescope/telescope-frecency.nvim',
    }
  }

  -- === treesitter ===
  use {'nvim-treesitter/nvim-treesitter', config = [[require('ploog.treesitter')]],
    requires = {'nvim-treesitter/nvim-treesitter-textobjects' , 'romgrk/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-refactor' , 'p00f/nvim-ts-rainbow'}
  }

  -- === completion ===
  use {'hrsh7th/nvim-compe', requires = {'tamago324/compe-zsh'},
    event = 'InsertEnter *', config = [[require('ploog.completion')]]}
  -- use {'nvim-lua/completion-nvim', config = function() require('ploog.completion') end,
    -- requires = 'aca/completion-tabnine'
  -- }

  -- === snippets ===
  -- use {'hrsh7th/vim-vsnip',  config = [[require('ploog.vsnip')]],
    -- requires = {'hrsh7th/vim-vsnip-integ'}
  -- }
  use {'SirVer/ultisnips', config = [[require('ploog.ultisnips')]], event = 'InsertEnter *'}
    -- requires = 'honza/vim-snippets'
  -- }
  -- use 'norcalli/snippets.nvim'
  -- config = 'require("klooj.ansibleSnips")'}

  -- === for everybody but raspberry pi's ===
  if not g.is_pi then

    use {'lervag/wiki.vim', 'tpope/vim-rhubarb', 'junegunn/gv.vim'}
    -- use {'wbthomason/pdf-scribe.nvim', opt = true, config = [[require('ploog.pdfscribe')]]}

    -- |> lsp
    use {'neovim/nvim-lspconfig', config = [[require('ploog.lsp_config')]],
      requires = {'klooj/nlua.nvim', 'glepnir/lspsaga.nvim'}
    }  --

    -- |> make and debug
    use {
      {'neomake/neomake', cmd = 'Neomake'},
      {'bfredl/nvim-luadev', cmd = 'Luadev'}
    }

    -- |> ansible
    use {'pearofducks/ansible-vim', config = [[require('ploog.ansible')]],
      ft = {'yaml', 'yaml.ansible', 'yml'}
    }
    use {'Glench/Vim-Jinja2-Syntax', ft = {'html', 'jinja', 'yaml', 'yaml.ansible'}}

    -- |>  R
    use {'jalvesaq/Nvim-R', config = [[require('ploog.nvimr')]],
      ft = {'R', 'Rmd', 'Rnw', 'Rd', 'Rrst'}
    }

    -- |>  python
    use {'psf/black', config = [[require('ploog.black')]], ft = {'python'}}

    -- |> c
    use {'rhysd/vim-clang-format', ft = {'c'}, config = [[require('ploog.clangd')]]}

    -- |> take it one step too far
    -- use {
    --   'glacambre/firenvim',
    --   run = function()
    --     vim.fn['firenvim#install'](0)
    --   end
    -- }

    if g.is_mac then
      use {'itspriddle/vim-marked', ft = {'markdown', 'wiki'}}
    end
  end

  --    === apparatuses ===
  use {'wbthomason/packer.nvim', opt = true}
  use {'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle',
    config = [[require('ploog.nvtree')]],
  }
  use {'gyim/vim-boxdraw', opt = true}
  use {'pechorin/any-jump.vim', config = [[require('ploog.anyjump')]],
    cmd = {'AnyJump', 'AnyJumpVisual', 'AnyJumpBack', 'AnyJumpLastResults'}
  }

  --   === treating text like objects ===
  use {'ntpeters/vim-better-whitespace', event = 'InsertLeavePre *',
    config = [[require('ploog.whitespace')]]
  }
  use {'AndrewRadev/sideways.vim', cmd = {'SidewaysLeft', 'SidewaysRight'}}

  --   === setup, startup, syntax, session ===
  use {'mbbill/undotree', cmd = 'UndotreeToggle',
    config = [[require('ploog.undotree')]]
  }

  --   === debug ===
  use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
  -- use {'puremourning/vimspector', opt = true,
    -- requires = {'nvim-telescope/telescope-vimspector.nvim', opt = true}
  -- }

  --    === ui accoutrement ===
  use {'AckslD/nvim-whichkey-setup.lua', requires = {'liuchengxu/vim-which-key'}}
  use {
    {'klooj/zephyr-nvim', opt = true},
    -- {'glepnir/zephyr-nvim', opt = true},
    -- {'ishan9299/modus-theme-vim', opt = true},
    {'Th3Whit3Wolf/spacebuddy', opt = true},
  }

  -- === filetype/syntax specific ===
  -- |> markdown
  use {'dkarter/bullets.vim', ft = {'markdown', 'wiki', 'pandoc'}, config = [[require('ploog.markdown')]],
    requires = {'reedes/vim-lexical', 'reedes/vim-pencil'}
  } -- 'plasticboy/vim-markdown',
  use {'vim-pandoc/vim-pandoc',  ft = {'markdown','wiki', 'pandoc'}, config = [[require('ploog.pandoc')]],
    requires = {'vim-pandoc/vim-pandoc-syntax', 'vim-pandoc/vim-pandoc-after',
      'klooj/vim-markdownfootnotes'}
  }
  use {'vim-pandoc/vim-rmarkdown', ft = {'Rmd'}}

  -- |> json
  use {'prettier/vim-prettier', requires = 'elzr/vim-json', config = [[require('ploog.pretty')]],
    ft = {'javascript', 'typescript', 'less', 'css', 'json', 'graphql', 'markdown'}
  }

  use {'cespare/vim-toml', ft = {'toml'}}

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

---------------------------

-- use {'lervag/vimtex', config = [[require('ploog.vimtex')]], ft = {'tex'}}

-- use {'dhruvasagar/vim-prosession', requires = {'tpope/vim-obsession'}, config = [[require('ploog.prosession')]] }
-- use {'dhruvasagar/vim-prosession', cmd = 'Prosession',
--   requires = {'tpope/vim-obsession', opt = true},
--   config = [[require('ploog.prosession')]]
-- }

-- treesitter
-- 'nvim-treesitter/nvim-treesitter-textobjects',
-- {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', config = 'require("klooj.tsPlayground")'}}

-- === git ===

-- use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

-- use 'SidOfc/mkdx'
-- use {'SidOfc/mkdx', ft = {'markdown'}}


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
-- use {'norcalli/snippets.nvim', config = 'require("snippets").use_suggested_mappings()'}

-- for fixing the completion in prompt issue
-- vim.cmd [[au BufEnter * if &filetype !='TelescopePrompt' | lua require('klooj.completion').imply() ]]
-- use 'nvim-treesitter/completion-treesitter'


--[[
use {'mfussenegger/nvim-dap', opt = true, requires = {'theHamsta/nvim-dap-virtual-text', 'mfussenegger/nvim-dap-python', 'nvim-telescope/telescope-dap.nvim'}}
use {'tjdevries/conf.vim', opt = true, requires = {'tjdevries/standard.vim','skywind3000/quickmenu.vim'}}
use {'voldikss/vim-floaterm', opt = true, config = 'require("ploog.floaterm")', requires = 'voldikss/fzf-floaterm'}

'andymass/vim-matchup'
'chaoren/vim-wordmotion''
'junegunn/vim-easy-align',
'justinmk/vim-dirvish'
'kristijanhusak/vim-dirvish-git'
'machakann/vim-sandwich'             -- replacement for surround, eh
'mattn/vim-sonictemplate'
'nvim-lua/lsp_extensions.nvim',
'Olical/vim-enmasse'
'rhysd/vim-clang-format', opt = true, rocks = {'lua-cjson', 'lpeg', 'asdf'}
'steelsojka/completion-buffers'
'tpope/vim-sexp-mappings-for-regular-people'
'wellle/targets.vim'
'justinmk/vim-sneak',
'airblade/vim-rooter', config = 'require("klooj.rooter")'}
'mharington/formatter.nvim', cmd = 'Format', config = 'require("klooj.formatter")'}
'AndrewRadev/splitjoin.vim',
{'romgrk/doom-one.vim', opt = true}

]]
