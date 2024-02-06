local packer = require("packer")

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

packer.startup({  
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -- colorschemes
    use("folke/tokyonight.nvim")
    -- nvim-tree
    use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"})
    -- bufferline
    use({
        "akinsho/bufferline.nvim", requires = {
        "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    use({
        "nvim-lualine/lualine.nvim", requires = {
        "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")  
    use {
        'nvim-telescope/telescope.nvim', requires = {
        "nvim-lua/plenary.nvim" } }
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ 
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use { "windwp/nvim-autopairs" }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }

  end
}) 

