local g = require('domain.global')
local lspconfig = require('lspconfig')

-- === actions to perform when lsp attaches to a buffer ===
local telescope_mapper = require('klooj.telescope.mappings')
local mapper = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

local custom_attach = function(client)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
		client.config.flags.allow_highlight = true
		client.config.flags.allow_indent = true
	end

	mapper('n', '<Leader>;', 'vim.lsp.buf.definition()')

	mapper('n', '<Leader>dn', 'vim.lsp.diagnostic.goto_next()')
	mapper('n', '<Leader>dp', 'vim.lsp.diagnostic.goto_prev()')
	mapper('n', '<Leader>dl', 'vim.lsp.diagnostic.show_line_diagnostics()')

	mapper('n', '<Leader>dR', 'MyLspRename()')

	telescope_mapper('<Leader>dr', 'lsp_references', nil, true)
	telescope_mapper('<Leader>dw', 'lsp_workspace_symbols', { ignore_filename = true }, true)
	telescope_mapper('<Leader>da', 'lsp_code_actions', nil, true)

	local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
	if filetype ~= 'lua' then
		mapper('n', 'K', 'vim.lsp.buf.hover()')
	end

	mapper('i', '<c-h>', 'vim.lsp.buf.signature_help()')

	vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- === individual server configs ===
lspconfig.vimls.setup {
	on_attach = custom_attach,
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
	on_attach = custom_attach
}
lspconfig.r_language_server.setup {
	on_attach = custom_attach
}
lspconfig.yamlls.setup {
	filetypes = {"yaml", "yml"},
	on_attach = custom_attach
}

if not g.is_pi then
	require('nlua.lsp.nvim').setup(lspconfig, {
		cmd = {g.sumneko_binary, "-E", g.sumneko_root_path .. "/main.lua"},
		on_attach = custom_attach,
		globals = {
			"vim", "Color", "c", "Group", "g", "s", "R",
		},
	})
end

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
