local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Ensure Packer manager is installed
-- if not install it
local ensure_packer = function()
  if not packer_installed then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

-- Packer manager bootstrap
local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)

  -- Packer: manage itself
  use("wbthomason/packer.nvim")

  -- Copilot: code completion
  use({ "zbirenbaum/copilot.lua", event = "VimEnter" })

  -- Mason: Manage LSP servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- LSP Config: Collection of LSP Config
  use("neovim/nvim-lspconfig")

  -- LSP Saga: LSP UI
  use("glepnir/lspsaga.nvim")

  -- CMP: Autocompletion
  use("hrsh7th/nvim-cmp")
  use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua" } })
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")
  use("onsails/lspkind.nvim")

  -- Telescope: Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- Git Signs: Git signs
  use("lewis6991/gitsigns.nvim")

  -- Nvim Tree: File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  -- Lualine: Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Null LS: Bridge between LSP and custom formatters like prettier
  use("jose-elias-alvarez/null-ls.nvim")

  -- Themes
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  use({ 'projekt0n/github-nvim-theme' })
  use 'navarasu/onedark.nvim'

  -- Auto Dark Mode: Automatically switch between light and dark mode based on Mac OS Mode
  use("f-person/auto-dark-mode.nvim")

  use "lukas-reineke/indent-blankline.nvim"



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
