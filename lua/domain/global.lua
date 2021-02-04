-- mostly copied from glepnir/nvim
local global    = {}
local home      = os.getenv("HOME")
local foonv     = os.getenv("FOONV")
local xdg       = os.getenv("XDG_CONFIG_HOME")
local xdgcache  = os.getenv("XDG_CACHE_HOME")
local packer    = os.getenv("XDG_DATA_HOME")
local sep       = '/'
local os_name   = vim.loop.os_uname().sysname
local arch_type = vim.loop.os_uname().machine

local neko = home .. sep .. "gits/lua-language-server"
local py3 = home .. sep .. ".pyenv/versions/neovim3.9/bin/python3"
local npm = xdg .. sep .. "nvm/versions/node/v14.15.1/bin/neovim-node-host"


function global:load_variables()

  self.sep         = sep
  self.cache_dir   = xdgcache .. '/nvim/'
  self.xdg         = xdg .. sep
  self.packerpath  = packer .. '/nvim/site/pack/packer/'
  self.vim_path    = foonv .. sep
  self.foonv       = foonv .. sep
  self.home        = home .. sep

  self.sumneko_root_path = neko
  self.py3 = py3
  self.npm  = npm

  if os.getenv("TRANSPARENT_TERM") then
    self.seeThrough = true
  end

  if os_name == 'Darwin' then
    self.is_mac = true
    self.sumneko_binary = neko .. "/bin/macOS/lua-language-server"
  elseif arch_type:find("armv") then
    self.is_pi = true
  elseif os_name == 'Linux' then
    self.is_linux = true
    self.sumneko_binary = neko .. "/bin/Linux/lua-language-server"
  end
end

global:load_variables()

return global
