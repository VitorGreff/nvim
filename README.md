This is a very basic neovim configuration that relies at lazy.nvim to load plugins. It covers all core editor functions and some quality of life aspects. Most bindings can be found at **vim-options.lua** file, except for some individual plugin configuration.

## Requirements

To properly load and use all plugins, you will need to have the following installed:

1. [yarn](https://yarnpkg.com/)
2. [lazygit](https://github.com/jesseduffield/lazygit)
3. [ripgrep](https://github.com/BurntSushi/ripgrep)

Also, it is recommended to have a default biome.json at root, so even in non-biome projects, you can have the autoformatting.
