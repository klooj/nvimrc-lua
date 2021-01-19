local glob = require('domain.global')
local opts = {
  extra_mapping = false,
  snippet_dir = glob.foonv .. "snippets"
}
VG("vsnip_", opts)
