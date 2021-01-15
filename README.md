# nvim on lua  

This repo configures neovim for macOS, ubuntu, and raspberry OS with language servers, tree-sitter, and completion, and it is written almost entirely in lua. I am fairly new to lua, nvim, and coding generally so if you stumble upon this repo, consider the source; try learning from my mistakes rather than following my lead. That being said, this setup is working fabulously for my modest programming needs.  
I have been sloppy about keeping track of attributions, but assume that nothing is original and most every file here originally came from [@tjdevries](github.com/tjdevries), [@wbthomason](github.com/wbthomason), or [@glepnir](github.com/glepnir).  

## a few guideposts  

In the absence of meaningful instructions, here's a few points worth noting:  
1. In lua files, `<localleader>gf` is mapped the same way as `gf` in other files but uses the object definition instead of the path. So, 'gf' on `require(some.file)`.
2. there is a file in after/plugins that sources lua/init.lua, making it the rough equivalent of after/init.lua. It is sourced using `luafile` rather than `require`; the operative difference is caching, with luafile running the code regardless.
3. configured plugins:
    - tree-sitter, lsp, completion (using snippets, tabnine, & lsp)
    - telescope, which-key ...
    - barbar, galaxyline, multiple themes
4. work in progress
    - prose mode
    - snippets
    - link-anything

### Layout and Navigation

2. Lua Directories:  
    * |-ploog/  files that merely declare plugin variables/settings  
    * |-klooj/  files that involve more complex operations ... like a kludge  
    * |-mood/   files for configuring the theme and ui
    * |-domain/ native settings, global options and vars, keymaps, etc ...
    * |-publibs/ exactly what it sounds like, probably will get broken up and renamed

## trajectory  

Ultimately, I need my nvim to serve as a word processor for legal writing as effectively as it does a traditional text editor. The next big hurdle is really leveraging the power of pandoc and markdown with some existing plugins and new resources to create an inituitive, unified interface for writing prose and code seamlessly.  

### near term todo  

1. install instructions, maybe a script, makefile, and/or dockerfile.  
    - language servers, pyenv, and other extras. maybe just throw my daily build script in here?  
2. remove every file and folder that is not actively in use.
3. finsh new statusline
4. finish snippets
5. fix tabnine completion
6. create a better, centralized method for which-key
