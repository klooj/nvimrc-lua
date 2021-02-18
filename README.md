# nvim on lua

(screenshot.png)

This repo configures neovim for macOS, ubuntu, and raspberry OS with language servers, tree-sitter, and completion, and it is written almost entirely in lua. I am fairly new to lua, nvim, and coding generally so if you stumble upon this repo, consider the source; try learning from my mistakes rather than following my lead. That being said, this setup is working fabulously for my modest programming needs. I have been sloppy about keeping track of attributions, but assume that nothing is original and most every file here originally came from [@tjdevries](https://github.com/tjdevries) or [@glepnir](https://github.com/glepnir).

## a few guideposts

In the absence of meaningful instructions, here's a few points worth noting:

- In lua files, <localleader>; is mapped the same way as gf in other files but uses the object definition instead of the path. So, 'gf' on require(some.file).
- configured plugins:
  - tree-sitter, lsp, completion (using snippets, tabnine, & lsp)
  - telescope, which-key ...
  - barbar, galaxyline, and multiple themes specifically configured for treesitter
- There is an ansible playbook that overlays this directory. If you have know the tiniest bit of ansible, you can run the play right from the root of this repo and it will build the nightly version of neovim on all the mac or debian based linux hosts of your choosing. Just make sure to populate the variables because they are mostly removed from this repo; see the [repo](https://klooj.github.io/nvim_build/) for more info.

### Layout

* ~/.config/nvim/lua/
  * |-ploog/  files that merely declare plugin variables/settings and are sourced explicitly
  * |-plugin/ file that are automatically sourced on login the same as vim/plugin
  * |-poob/   public helper funcs
  * |-klooj/  files that involve more complex operations ... like a kludge  
  * |-mood/   files for configuring the theme and ui  
  * |-domain/ native settings, global options and vars, keymaps, plugin list, etc ...  


## trajectory

Ultimately, I'd like nvim to perform as a word processor with the same agile power it wields in traditional text editing. The next big hurdle is leveraging the power of pandoc and markdown without reinventing the wheel, combining some existing plugins with new resources to create an inituitive, unified interface for writing prose and code seamlessly.

### todo

- [ ] instructions; maybe even a script, makefile, and/or dockerfile.
- [ ] explanation of language servers, pyenv, and other extras used. maybe just throw my daily build script in here?
- [ ] explanation of all the markdown & wiki features; prose mode
- [ ] finsh new statusline
- [ ] remove every file and folder that is not actively in use.
- [ ] finish snippets
- [x] fix tabnine completion
- [ ] create a better, centralized method for which-key
