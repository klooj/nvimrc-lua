local format    = require('klooj.format')
local g         = require('domain.global')
local KJ        = require('klooj.utils')
local lspconfig = require('lspconfig')
local saga      = require('lspsaga')
-- local api = vim.api

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

saga.init_lsp_saga {
  finder_action_keys = { open = 'o', vsplit = 'v', split = 's', quit = 'q' },
}


--[[  === custom attach function ===
Any time a file is opened that matches the type of a language server configured below,
these actions will take place upon the lsp attaching to the buffer. I have set it up
to do keymappings that are only relevant in conjunction with an lsp. most of them
follow the pattern <leader>d
]]
local custom_init = function(client)
  client.config.flags.allow_incremental_sync = true
  client.config.flags.allow_highlight = false
  client.config.flags.allow_indent = true
-- end

-- local custom_attach = function(client)
  -- completion.on_attach(client)


  -- |> configs applying to all clients
  -- local filetype = vim.api.nvim_buf_get_option(0, 'filetype')


  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
    nrmap{l .. "dF", function() vim.lsp.buf.formatting() end, {nowait = true, buffer = true}}
  elseif client.resolved_capabilities.document_range_formatting then
    nrmap{l .. "dF", function() vim.lsp.buf.range_formatting() end, {nowait = true, buffer = true}}
  end

  local nrmap = vim.keymap.nnoremap
  local xrmap = vim.keymap.xnoremap
  -- local irmap = vim.keymap.inoremap
  local l     = [[<Leader>]]
  local telescope_mapper = require('klooj.telescope.mappings')

  -- |> keymaps are all prefixed by leader
  telescope_mapper(l .. 'dr', 'lsp_references', nil, true)
  telescope_mapper(l .. 'dw', 'lsp_workspace_symbols', { ignore_filename = true }, true)

  nrmap{'<CR>'   , function() vim.lsp.buf.definition() end                                , {nowait = true, buffer = true}}
  nrmap{'gh'     , function() require("lspsaga.provider").lsp_finder() end                , {nowait = true, buffer = true}}
  nrmap{l .. 'd]', function() require('lspsaga.diagnostic').lsp_jump_diagnostic_next() end, {nowait = true, buffer = true}}
  nrmap{l .. 'd[', function() require('lspsaga.diagnostic').lsp_jump_diagnostic_prev() end, {nowait = true, buffer = true}}
  nrmap{l .. 'dl', function() require("lspsaga.diagnostic").show_line_diagnostics() end   , {nowait = true, buffer = true}}
  nrmap{l .. 'dp', function() require("lspsaga.provider").preview_definition() end        , {nowait = true, buffer = true}}
  nrmap{l .. 'da', function() require("lspsaga.codeaction").code_action() end             , {nowait = true, buffer = true}}
  xrmap{l .. 'da', function() require("lspsaga.codeaction").code_action() end             , {nowait = true, buffer = true}}
  nrmap{l .. 'ds', function() require("lspsaga.signaturehelp").signature_help() end       , {nowait = true, buffer = true}}
  nrmap{l .. 'dR', function() require("lspsaga.rename").rename() end                      , {nowait = true, buffer = true}}
  nrmap{'K'      , function() require("lspsaga.hover").render_hover_doc() end             , {nowait = true, buffer = true}}
  nrmap{'<C-0>'  , function() require("lspsaga.hover").smart_scroll_hover(1) end          , {nowait = true, buffer = true}}
  nrmap{'<C-9>'  , function() require("lspsaga.hover").smart_scroll_hover(-1) end         , {nowait = true, buffer = true}}

  vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- |> servers
local noFuss = {'bashls', 'cmake', 'jsonls', 'jedi_language_server', 'r_language_server', 'yamlls', 'vimls'}
for _, lsp in ipairs(noFuss) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    -- on_attach = custom_attach,
    on_init = custom_init
    -- client.config.flags.allow_incremental_sync = true,
    -- client.config.flags.allow_highlight = false,
    -- client.config.flags.allow_indent = true,
  }
end


lspconfig.clangd.setup {
  cmd = {
    "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy", "--header-insertion=iwyu",
  },
  -- on_attach = custom_attach,
  on_init = custom_init,
  capabilities = capabilities,
}

-- SUMNEKO
local get_lua_runtime = function()
  local result = {}
  local sorted_rt = {}

  for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. "/lua/";
    if vim.fn.isdirectory(lua_path) then
      result[lua_path] = true
    end
  end

  result[vim.fn.expand("$VIMRUNTIME/lua")] = true
  result[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
  result[vim.fn.expand("~/build/neovim/src/nvim/lua")] = true

  sorted_rt = KJ.table_unique(result)
  return sorted_rt
end

if not g.is_pi then
  lspconfig.sumneko_lua.setup {
    cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
    -- on_attach = custom_attach,
    on_init = custom_init,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';')
          -- path = KJ.table_unique(vim.split(package.path, ';'))
        },
        diagnostics = {
          enable = true,
          disable = "trailing-space",
          globals = {'vim'},
        },
        telemetry = {
          enable = false
        },
        workspace = {
          library = get_lua_runtime(),
          maxPreload = 2000,
          preloadFileSize = 1000,
        },
      },
    },
  }
end


--------
  -- vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- filetypes = {"lua"},
-- lspconfig.texlab.setup {
--   settings = {
--     latex = {forwardSearch = {executable = 'zathura', args = {'%f'}}}
--   },
--   commands = {
--     TexlabForwardSearch = {
--       function()
--         local pos = vim.api.nvim_win_get_cursor(0)
--         local params = {
--           textDocument = {uri = vim.uri_from_bufnr(0)},
--           position = {line = pos[1] - 1, character = pos[2]}
--         }
--         vim.lsp.buf_request(0, 'textDocument/forwardSearch', params,
--                         function(err, _, _, _) if err then error(tostring(err)) end end)
--       end,
--       description = 'Run synctex forward search'
--     }
--   }
-- }

-- '?.lua',
-- '?/init.lua',
-- vim.fn.expand('~/.luarocks/share/lua/5.1/?.lua'),
-- vim.fn.expand('~/.luarocks/share/lua/5.1/?/init.lua'),

-- local function preview_location_callback(_, _, result)
--   if result == nil or vim.tbl_isempty(result) then
--     return nil
--   end
--   vim.lsp.util.preview_location(result[1])
-- end

-- function PeekDefinition()
--   local params = vim.lsp.util.make_position_params()
--   return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
-- end
-----

-- require('nlua.lsp.nvim').setup(require('lspconfig'), {
--   cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
--   on_attach = custom_attach,
-- })

-- require('nlua.lsp.nvim').setup(lspconfig, {
--   cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
-- on_attach = custom_attach,
--   globals = {
--     "vim", "Color", "c", "Group", "g", "s", "R",
--   },
-- })
-- end
-- require('plenary.job')

-- lspconfig.vimls.setup {
--   on_attach = custom_attach,
--   -- capabilities = capabilities,
--   -- capabilities.textDocument.completion.completionItem.snippetSupport = true,
--   indexes = {
--     gap = 50, -- index time gap between next file
--     count = 6, -- count of files index at the same time
--   }
-- }

--[==[ benched in favor of lspsaga

mapper('i', '<c-h>', 'vim.lsp.buf.signature_help()')
api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
mapper('n', l .. 'dn', 'vim.lsp.diagnostic.goto_next()')
mapper('n', l .. 'dp', 'vim.lsp.diagnostic.goto_prev()')
telescope_mapper(l .. 'da', 'lsp_code_actions', nil, true)
mapper('n', l .. 'dR', 'MyLspRename()')

-- === misc. lsp funcs and extras from @tjdevries ===
function MyLspRename()
local current_word = vim.fn.expand("<cword>")
local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.2)
vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
vim.api.nvim_win_close(plenary_window.win_id, true)

if text ~= '' then
vim.schedule(function()
vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })

vim.lsp.buf.rename(text)
end)
else
print("Nothing to rename!")
end
end)

vim.cmd [[startinsert]]
end

local sign_decider
if true then
sign_decider = function(bufnr)
local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
-- No buffer local variable set, so just enable by default
if not ok then
return true
end

return result
end
else
-- LOL, alternate signs.
sign_decider = coroutine.wrap(function()
while true do
coroutine.yield(true)
coroutine.yield(false)
end
end)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
underline = true,
virtual_text = true,
signs = sign_decider,
update_in_insert = false,
}
)
-- local completion = require('completion')
-- === mapping funcs used in custom attach
-- local mapper = function(mode, key, result)
-- api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
-- end

  -- local nnoremap = vim.keymap.nnoremap

  -- local lspkeys, lspcmd
  -- lspcmd = "function() " .. cmd .. " end"


  -- local xrmap = function(kbd, cmd)
  --   lspkeys = l .. kbd
  --   lspcmd = "function() " .. cmd .. " end"
  --  vim.keymap.nnoremap{lspkeys, lspcmd, {nowait = true, buffer = true}}
  -- end


]==]
