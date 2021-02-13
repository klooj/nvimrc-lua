local g = require('domain.global')
local lspconfig = require('lspconfig')
local api = vim.api
local format = require('klooj.format')
local completion = require('completion')

local capabilities = vim.lsp.protocol.make_client_capabilities()

local saga = require('lspsaga')
saga.init_lsp_saga {
  finder_action_keys = {
    open = 'o', vsplit = 'v', split = 's', quit = 'q'
  },
}

-- === mapping funcs used in custom attach
local telescope_mapper = require('klooj.telescope.mappings')
local mapper = function(mode, key, result)
  api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

--[[  === custom attach function ===
Any time a file is opened that matches the type of a language server configured below,
these actions will take place upon the lsp attaching to the buffer. I have set it up
to do keymappings that are only relevant in conjunction with an lsp. most of them
follow the pattern <leader>d
]]
local custom_attach = function(client)
  -- |> configs applying to all clients
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
    -- client.config.flags.allow_highlight = true
    -- client.config.flags.allow_indent = true
  end

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
    mapper("n", "<Leader>dF", "vim.lsp.buf.formatting()")
  elseif client.resolved_capabilities.document_range_formatting then
    mapper("n", "<Leader>dF", "vim.lsp.buf.range_formatting()")
  end

  completion.on_attach(client)

  -- |> keymaps
  mapper('n', '<CR>', 'vim.lsp.buf.definition()')
  mapper('n', 'gh', 'require("lspsaga.provider").lsp_finder()')

  mapper('n', '<Leader>d]', 'require("lspsaga.diagnostic").lsp_jump_diagnostic_next()')
  mapper('n', '<Leader>d[', 'require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()')
  mapper('n', '<Leader>dl', 'require("lspsaga.diagnostic").show_line_diagnostics()')
  mapper('n', '<Leader>df', 'require("lspsaga.provider").preview_definition()')

  telescope_mapper('<Leader>dr', 'lsp_references', nil, true)
  telescope_mapper('<Leader>dw', 'lsp_workspace_symbols', { ignore_filename = true }, true)

  mapper('n', '<Leader>da' ,'require("lspsaga.codeaction").code_action()')
  mapper('x', '<Leader>da' ,'require("lspsaga.codeaction").code_action()')
  mapper('n', '<leader>ds' ,'require("lspsaga.signaturehelp").signature_help()')
  mapper('n', '<leader>dR' ,'require("lspsaga.rename").rename()')
  mapper('n', 'K'          ,'require("lspsaga.hover").render_hover_doc()')
  mapper('n', '<C-S>'      ,'require("lspsaga.hover").smart_scroll_hover(1)')
  mapper('n', '<C-A>'      ,'require("lspsaga.hover").smart_scroll_hover(-1)')

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

local noFuss = {'bashls', 'cmake', 'jsonls', 'jedi_language_server', 'r_language_server', 'yamlls', 'vimls'}
for _, lsp in ipairs(noFuss) do
  lspconfig[lsp].setup { on_attach = custom_attach }
end


local get_lua_runtime = function()
  local result = {};

  for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. "/lua/";
    if vim.fn.isdirectory(lua_path) then
      result[lua_path] = true
    end
  end

  result[vim.fn.expand("$VIMRUNTIME/lua")] = true
  result[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
  result[vim.fn.expand("~/build/neovim/src/nvim/lua")] = true

  return result;
end

local setup_sumneko = function()
  lspconfig.sumneko_lua.setup {
    cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
    on_attach = custom_attach,
    filetypes = {"lua"},
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = {
            '?.lua',
            '?/init.lua',
            vim.fn.expand('~/.luarocks/share/lua/5.1/?.lua'),
            vim.fn.expand('~/.luarocks/share/lua/5.1/?/init.lua'),
            vim.split(package.path, ';'),
          }
        },
        diagnostics = {
          globals = {"vim"},
          enable = true,
          disable = "trailing-space"
        },
        telemetry = {
          enable = false
        },
        workspace = {
          library = get_lua_runtime(),
          makePreload = 2000,
          preloadFileSize = 1000,
        },
      },
    },
  }
end

if not g.is_pi then
  setup_sumneko()
end

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
mapper('n', '<Leader>dn', 'vim.lsp.diagnostic.goto_next()')
mapper('n', '<Leader>dp', 'vim.lsp.diagnostic.goto_prev()')
telescope_mapper('<Leader>da', 'lsp_code_actions', nil, true)
mapper('n', '<Leader>dR', 'MyLspRename()')

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

]==]
