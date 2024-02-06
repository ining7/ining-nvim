# Neovim Configuration

## Configuration Structure

- `init.lua`: The main entry point that sets up the core configurations and loads other Lua modules.
- `lua/`: Contains all Lua modules and scripts for the configuration.
  - `basic.lua`: Sets up basic editor configurations.
  - `colorscheme.lua`: Configures the Neovim color scheme.
  - `keybindings.lua`: Custom key mappings for Neovim.
  - `lsp.lua`: Language Server Protocol configurations for enhanced code editing.
  - `plugin-config/`: Individual configurations for each plugin.
    - `bufferline.lua`: Enhances buffer management.
    - `dashboard.lua`: Provides a startup dashboard.
    - `lualine.lua`: Configures the status line.
    - `nvim-autopairs.lua`: Automatic bracket pairing.
    - `nvim-cmp.lua`: Autocompletion setup.
    - `nvim-tree.lua`: A file explorer sidebar.
    - `nvim-treesitter.lua`: Better syntax highlighting and parsing.
    - `project.lua`: Project navigation and management.
  - `plugins.lua`: Plugin management via Packer.
- `plugin/packer_compiled.lua`: Auto-generated file by Packer for optimized plugin loading.