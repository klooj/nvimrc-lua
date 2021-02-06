local opts = {
	-- checkbox_markers = ' .oX',
	checkbox_partials_toggle = 1,
	delete_last_bullet_if_empty = 1,
	enabled_file_types = {
		'markdown',
		'wiki',
		'text',
		'scratch',
		'gitcommit'
	},
	enable_in_empty_buffers = 0,
	line_spacing = 1,  -- this is 0, use 2 for 1
	-- mapping_leader = '<localleader>',
	nested_checkboxes = 1,
	pad_right = 1,
	renumber_on_change = 1,
	set_mappings = 0,
}
VG("bullets_", opts)
--[[
use 'dkarter/bullets.vim'
need to remap imap <cr> and <c-cr> for insert new bullet
nmap o "

unmap my > to >> maps
renumber gN - visual renumber
leader x toggle checkbox
]]
