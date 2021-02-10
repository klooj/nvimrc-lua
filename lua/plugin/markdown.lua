-- pencil
vim.g['pencil#wrapModeDefault'] = 'soft'
vim.g['pencil#autoformat'] = 1
vim.g['pencil#textwidth'] = 80
vim.g['pencil#cursorwrap'] = 0
vim.g['pencil#joinspaces'] = 1

-- prettier

vim.g['prettier#autoformat_require_pragma'] = 0
-- vim.g['prettier#autoformat_config_present'] = 1
vim.g['prettier#exec_cmd_async'] = 1
vim.g['prettier#quickfix_auto_focus'] = 0

-- marked
vim.g.marked_app = 'Marked'

-- plasticboy
local opts = {
	anchorexpr = 'substitute(v:anchor, "-", " ", "g")', -- convert my-tag to my tag
	auto_insert_bullets = 0,
	autowrite = 1,
	conceal = 2,
	conceal_code_blocks = 0,
	edit_url_in = 'tab',
	emphasis_multiline = 0,
	-- fenced_languages = {
	--   viml = 'vim',
	--   zsh  = 'sh',
	--   lua  = 'lua'
	-- },
	folding_disabled = 1,
	follow_anchor = 1,
	frontmatter = 1,
	math = 1,
	new_list_item_indent = 0,
	-- toc_autofit = 1,
}

VG("vim_markdown_", opts)

-- folding_level = 3,
-- no_extensions_in_markdown = 1,


--------------

-- pencil
-- vim.g['pencil#wrapModeDefault'] = 'soft'
-- vim.g['pencil#autoformat'] = 1
-- vim.g['pencil#textwidth'] = 80
-- vim.g['pencil#cursorwrap'] = 0
-- VG('mkdx#settings', shmopts)

-- mkdx
-- vim.g.tex_conceal = ""
-- let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"

-- If you want to have a link like this [link text](link-url) and follow it for editing in
-- vim using the ge command, but have it open the file "link-url.md" instead of the file
-- "link-url"
-- let g:vim_markdown_no_extensions_in_markdown = 1
-- vim.g['mkdx#settings'] = {
--   auto_update = {enable = 1},
--   enter = {
--     enable = 1,
--     shift = 1,
--     o = 1,
--     shifto = 1,
--     malformed = 1,
--   },
--   fold = {enable = 0}, -- does not work with markdown_folding
--   gf_on_steroids = 1,
--   highlight = {enable = 0},
--   links = {
--     external = {enable = 1 },
--     fragment = {
--       jumplist =1,
--       complete = 1,
--     },
--   },
--   map = {
--     enable = 1,
--     prefix = '<leader>m',
--   },
--   toc = {
--     update_on_write = 1,
--     save_on_write = 1,
--     position = 1,
--     -- details = {
--     --   enable = 1,
--     --   summary = 'Click to expand {{toc.text}}',
--     --   nesting_level = 2,
--     --   child_count = 5,
--     --   child_summar = 'show {{count}} items',
--   },
--   tokens = {
--     enter = {"-", "*", "+", ">"},
--     fence = '`',
--     bold = {'_', '**'},
--     list = {'-', '*', '+'},
--   },
-- }
