local glob = require('domain.global')
local opts = {
  tmux_title = 1,
  on_startup = 0,
  dir = glob.home .. ".cache/nvim/sessions",
  per_branch = 1,
}
VG("prosession_", opts)
