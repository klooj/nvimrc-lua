# nvim on lua  

This repo configures neovim with language servers, tree-sitter, and completion, and it is written almost entirely in lua. I am fairly new to lua, nvim, and coding generally so if you stumble upon this repo, consider the source; try learning from my mistakes rather than following my lead. That being said, this setup is working fabulously for my modest programming needs.  
I have been sloppy about keeping track of attributions, but assume that nothing is original and most every file here originally came from [@tjdevries](github.com/tjdevries), [@wbthomason](github.com/wbthomason), or [@glepnir](github.com/glepnir).  

## a few guideposts  

In the absence of meaningful instructions, here's a few points worth noting:  
1. In lua files, use '<localleader>gf' the way you would 'gf' in other files.
2. there is a file in after/plugins that sources lua/init.lua, making it the rough equivalent of after/init.lua. Also, it is sourced using `luafile` rather than `require`; the operative difference is caching, where luafile runs the code regardless.
3. configured plugins:
    - telescope
    - which-key
    - barbar, galaxyline, multiple themes  

### Layout and Navigation

2. Lua Directories:  
    * |-ploog/  files that merely declare plugin variables/settings  
    * |-klooj/  files that involve more complex operations ... like a kludge  
    * |-mood/   files for configuring the theme theme and ui
    * |-domain/ native settings, global options and vars, keymaps, etc ...



    +
    + layout: $FOONV/lua/
  |-lspsaga/*exactly what it sounds like
  |-internal/*  mappings, autocommands ... it's a bit of a mixed bag rn.
  |-publibs/*   helper functions

## trajectory  

Ultimately, I need my nvim to serve as a word processor for legal writing as effectively as it does a traditional text editor. The next big hurdle is really leveraging the power of pandoc and markdown with some existing plugins and new resources to create an inituitive, unified interface for writing prose.  

### near term todo  

1. install instructions, maybe a script, makefile, and/or dockerfile.  
    - language servers, pyenv, and other extras. maybe just throw my daily build script in here?  
2. remove every file and folder that is not actively in use.
3. finsh new statusline
4. finish snippets
5. fix tabnine completion
6. create a better, centralized method for which-key
