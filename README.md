This is a very basic neovim configuration that relies at lazy.nvim to load plugins. It covers all core editor functions and some quality of life aspects. Most bindings can be found at **vim-options.lua** file, except for some individual plugin configuration.

## Requirements

To properly load and use all plugins, you need to have the following installed:

1. [yarn](https://yarnpkg.com/)
2. [lazygit](https://github.com/jesseduffield/lazygit)
3. [ripgrep](https://github.com/BurntSushi/ripgrep)
4. [prettierd](https://github.com/fsouza/prettierd?tab=readme-ov-file)
   - npm packages are linked with your current node version, this means that if you change your node version, prettierd will need to be reinstalled.

The rest of the plugins can be installed via lazy and all the lsps can be installed via **:MasonInstallAll**. Make sure that the "ensure_installed" field is uncommented at lsp-config.lua file to allow a more direct installation of all listed lsps.
