local opts = {
  enabled_file_types = {
    'markdown',
    'wiki',
    'text',
    'scratch',
    'gitcommit'
  },
  enable_in_empty_buffers = 0,
  set_mappings = 1,
  mapping_leader = '<localleader>',
  delete_last_bullet_if_empty = 1,
  line_spacing = 1,  -- this is 0, use 2 for 1
  pad_right = 1,
  renumber_on_change = 1,
  checkbox_markers = ' ○◐●✓',
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
