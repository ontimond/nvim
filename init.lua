require("config.global")

if packer_installed then
  require("config.base")
  require('config.catppuccin')
  require('config.github-theme')
  require("config.auto-dark-mode")
  require("config.lsp-saga")
  require("config.mason")
  require("config.cmp")
  require("config.copilot")
  require("config.telescope")
  require("config.gitsigns")
  require("config.nvimtree")
  require("config.lualine")
  require("config.nullls")
end

require("config.packer")
