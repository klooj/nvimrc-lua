local g = require('domain.global')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

require('snippets').use_suggested_mappings()

-- === mapping funcs used in custom attach
local telescope_mapper = require('klooj.telescope.mappings')
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

-- === lspsaga config ===
local saga = require('lspsaga')
saga.init_lsp_saga {
  finder_action_keys = {
    open = 'o', vsplit = 'v', split = 's', quit = 'q'
  },
}

--[[  === custom attach function ===
Any time a file is opened that matches the type of a language server configured below,
these actions will take place upon the lsp attaching to the buffer. I have set it up
to do keymappings that are only relevant in conjunction with an lsp. most of them
follow the pattern <leader>d
]]
local custom_attach = function(client)
  -- |> configs applying to all clients
  capabilities = capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- if client.config.flags then
    -- client.config.flags.allow_incremental_sync = true
    -- client.config.flags.allow_highlight = true
    -- client.config.flags.allow_indent = true
  -- end

  -- |> keymaps
  mapper('n', '<CR>', 'vim.lsp.buf.definition()')
  mapper('n', 'gh', 'require("lspsaga.provider").lsp_finder()')

  -- mapper('n', '<Leader>dn', 'vim.lsp.diagnostic.goto_next()')
  -- mapper('n', '<Leader>dp', 'vim.lsp.diagnostic.goto_prev()')
  mapper('n', '<Leader>d]', 'require("lspsaga.diagnostic").lsp_jump_diagnostic_next()')
  mapper('n', '<Leader>d[', 'require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()')
  mapper('n', '<Leader>dl', 'require("lspsaga.diagnostic").show_line_diagnostics()')
  mapper('n', '<Leader>df', 'require("lspsaga.provider").preview_definition()')

  if client.resolved_capabilities.document_formatting then
    mapper("n", "<Leader>dF", "vim.lsp.buf.formatting()")
  elseif client.resolved_capabilities.document_range_formatting then
    mapper("n", "<Leader>dF", "vim.lsp.buf.range_formatting()")
  end

  telescope_mapper('<Leader>dr', 'lsp_references', nil, true)
  telescope_mapper('<Leader>dw', 'lsp_workspace_symbols', { ignore_filename = true }, true)

  mapper('n', '<Leader>da' ,'require("lspsaga.codeaction").code_action()')
  mapper('x', '<Leader>da' ,'require("lspsaga.codeaction").code_action()')
  mapper('n', '<leader>ds' ,'require("lspsaga.signaturehelp").signature_help()')
  mapper('n', '<leader>dR' ,'require("lspsaga.rename").rename()')
  mapper('n', 'K'          ,'require("lspsaga.hover").render_hover_doc()')
  mapper('n', '<C-S>'      ,'require("lspsaga.hover").smart_scroll_hover(1)')
  mapper('n', '<C-A>'      ,'require("lspsaga.hover").smart_scroll_hover(-1)')

  -- mapper('i', '<c-h>', 'vim.lsp.buf.signature_help()')
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- === individual server configs ===
lspconfig.vimls.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  indexes = {
    gap = 50, -- index time gap between next file
    count = 6, -- count of files index at the same time
  }
}
lspconfig.bashls.setup {
  on_attach = custom_attach
}
lspconfig.cmake.setup {
  on_attach = custom_attach
}
lspconfig.jsonls.setup {
  on_attach = custom_attach
}
lspconfig.jedi_language_server.setup {
  -- capabilities = capabilities,
  on_attach = custom_attach
}
lspconfig.r_language_server.setup {
  -- capabilities = capabilities,
  on_attach = custom_attach
}
lspconfig.yamlls.setup {
  -- capabilities = capabilities,
  filetypes = {"yaml", "yml"},
  on_attach = custom_attach
}

if not g.is_pi then
  -- lspconfig.sumneko_lua.setup {
  --   cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
  --   on_attach = custom_attach,
  --   -- capabilities = capabilities,
  --   runtime = {
  --     version = 'LuaJIT',
  --     path = vim.split(package.path, ';'),
  --   },
  --   diagnostics = {
  --     globals = {"vim"}
  --   },
  --   workspace = {
  --     library = {
  --       [vim.fn.expand('$VIMRUNTIME/lua')] = true,
  --       [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
  --     },
  --   },
  -- }
-- end
    require('nlua.lsp.nvim').setup(lspconfig, {
    --   cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
      on_attach = custom_attach,
    --   globals = {
    --     "vim", "Color", "c", "Group", "g", "s", "R",
    --   },
    })
end
require('plenary.job')
--[==[ benched in favor of lspsaga
-- === misc. lsp funcs and extras from @tjdevries ===
  -- telescope_mapper('<Leader>da', 'lsp_code_actions', nil, true)
  -- mapper('n', '<Leader>dR', 'MyLspRename()')
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
]==]

-- local sign_decider
-- if true then
--   sign_decider = function(bufnr)
--     local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
--     -- No buffer local variable set, so just enable by default
--     if not ok then
--       return true
--     end

--     return result
--   end
-- else
--   -- LOL, alternate signs.
--   sign_decider = coroutine.wrap(function()
--     while true do
--       coroutine.yield(true)
--       coroutine.yield(false)
--     end
--   end)
-- end

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = true,
--     signs = sign_decider,
--     update_in_insert = false,
--   }
-- )

--[[
local nvim_status = require('lsp-status')
local status = require('klooj.lsp_status')
local completion = require('completion')

Turn on status.
status.activate()
completion.on_attach(client)
status.on_attach(client)
sumneko_command = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
]]
