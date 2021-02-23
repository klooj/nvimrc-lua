local glob = require('domain.global')
local opts = {
  tmux_title = 1,
  tmux_title_format = "nv: @@@",
  on_startup = 1,
  default_session = 1,
  dir = glob.foonv .. "sessions",
  -- dir = glob.home .. ".cache/nvim/sessions",
  per_branch = 1,
}
VG("prosession_", opts)
