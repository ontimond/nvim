vim.cmd([[packadd packer.nvim]])

-- Ensure Packer manager is installed
-- if not install it
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

-- Packer bootstrpa
local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })


  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup {
        plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
      }
    end
  }
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("onsails/lspkind.nvim") -- vscode-like pictograms
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "lewis6991/gitsigns.nvim",
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  })
  use({
    "nvim-tree/nvim-tree.lua",
  })
  use("nvim-lualine/lualine.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato", -- mocha, macchiato, frappe, latte
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },

      }
      vim.api.nvim_command("colorscheme catppuccin")
    end
  }
  use("f-person/auto-dark-mode.nvim")


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
