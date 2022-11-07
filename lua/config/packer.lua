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
  use("nvim-tree/nvim-tree.lua")

  -- Lualine: Status line
  use("nvim-lualine/lualine.nvim")

  -- Null LS: Bridge between LSP and custom formatters like prettier
  use("jose-elias-alvarez/null-ls.nvim")
  use ({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- Auto Dark Mode: Automatically switch between light and dark mode based on Mac OS Mode
  use("f-person/auto-dark-mode.nvim")


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
