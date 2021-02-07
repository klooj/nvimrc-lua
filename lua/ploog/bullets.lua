local opts = {
	checkbox_markers = '○◐✗',
	-- checkbox_markers = ' .oX',
	enabled_file_types = {'markdown', 'wiki', 'text', 'scratch', 'gitcommit'},
	-- mapping_leader = '<localleader>',
	set_mappings = 0,
}
VG("bullets_", opts)

-- defaults
-- checkbox_partials_toggle = 1,
-- delete_last_bullet_if_empty = 1,
-- enable_in_empty_buffers = 0,
-- renumber_on_change = 1,
-- pad_right = 1,
-- nested_checkboxes = 1,
-- line_spacing = 1,  -- this is 0, use 2 for 1

--[[
use 'dkarter/bullets.vim'
need to remap imap <cr> and <c-cr> for insert new bullet
nmap o "

unmap my > to >> maps
renumber gN - visual renumber
leader x toggle checkbox
]]
