This is a very basic neovim configuration that relies at lazy.nvim to load plugins. It covers all core editor functions and some quality of life aspects. Most bindings can be found at **vim-options.lua** file, except for some individual plugin configuration.

## Requirements

To properly load and use all plugins, you will need to have the following installed:

### Core

1. [Neovim](https://neovim.io/) >= 0.11
2. A C compiler (`gcc` or `cc`) — required for treesitter parser compilation
3. [Git](https://git-scm.com/)

### Language toolchains

4. [Node.js](https://nodejs.org/) and npm — required by Mason for most LSP servers and formatters
5. [Go](https://go.dev/) — required for `gopls`, `goimports`, `gofumpt`
6. [Python 3](https://www.python.org/) and `python3-venv` — required for `ruff`
7. [Rust](https://www.rust-lang.org/) and Cargo — required for `rust_analyzer`, `rustfmt`
8. [Gleam](https://gleam.run/) — LSP configured outside Mason

### External tools

9. [ripgrep](https://github.com/BurntSushi/ripgrep) — used by Telescope for `live_grep`
10. [lazygit](https://github.com/jesseduffield/lazygit) — git TUI integration
11. [yarn](https://yarnpkg.com/) — used by markdown-preview.nvim

For JS/TS projects, if a `biome.json` is present, Biome will be used for formatting; otherwise, Prettier (`prettierd`) will be used as the fallback.
