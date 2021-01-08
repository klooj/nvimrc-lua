-- mostly copied from glepnir/nvim
local global    = {}
local home      = os.getenv("HOME")
local foonv     = os.getenv("FOONV")
local xdg       = os.getenv("XDG_CONFIG_HOME")
local xdgcache  = os.getenv("XDG_CACHE_HOME")
local packer    = os.getenv("XDG_DATA_HOME")
local sep  = '/'
local os_name   = vim.loop.os_uname().sysname
local arch_type = vim.loop.os_uname().machine


function global:load_variables()
  if os_name == 'Darwin' then
    self.is_mac = true
  elseif arch_type:find("armv") then
    self.is_pi = true
  elseif os_name == 'Linux' then
    self.is_linux = true
  end
  self.cache_dir   = xdgcache .. '/nvim/'
  self.xdg         = xdg .. sep
  self.packerpath  = packer .. '/nvim/site/pack/packer/'
  self.vim_path    = foonv .. sep
  self.sep         = sep
  self.home        = home .. sep
  self.sumneko_root_path = global.home .. "gits/lua-language-server"

end

global:load_variables()

return global
