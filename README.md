# nvim on lua  

This repo configures neovim with language servers, tree-sitter, and completion, and it is written almost entirely in lua. I am fairly new to lua, nvim, and coding generally so if you stumble upon this repo, consider the source; try learning from my mistakes rather than following my lead. That being said, this setup is working fabulously for my modest programming needs.

## a few guideposts  

In the absence of meaningful instructions, here's a few points worth noting:  
1. I have been sloppy about keeping track of attributions, but assume that every file here originally came from [@tjdevries](github.com/tjdevries), [@wbthomason](github.com/wbthomason), or [@glepnir](github.com/glepnir).  
2. Lua Directories:  
    - ploog/ is for files that simply declare variables for plugins
    - klooj/ is for files that contain functions and are more like a kludge
    - mood/ is for theme and ui related files
    - domain/ is for settings options, keymaps, etc...  
    - every benched/ directory is the equivalent of a trash folder.  
3. there is a file in after/plugins that sources lua/init.lua, making it the rough equivalent of after/init.lua
4. configured plugins:
    - telescope
    - which-key
    - barbar, galaxyline, multiple themes  

## trajectory  

Ultimately, I need my nvim to serve as a word processor for legal writing as effectively as it does a traditional text editor. The next big hurdle is really leveraging the power of pandoc and markdown with some existing plugins and new resources to create an inituitive, unified interface for writing prose.  

### near term todo  

1. install instructions, maybe a script, makefile, and/or dockerfile.  
    - language servers, pyenv, and other extras. maybe just throw my daily build script in here?  
2. remove every file and folder that is not actively in use.
