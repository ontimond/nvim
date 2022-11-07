require("config.packer-bootstrap")

if packer_installed then
  require("config.base")
  require("config.auto-dark-mode")
  require('config.catppuccin')
  require("config.lsp")
  require("config.cmp")
  require("config.copilot")
  require("config.telescope")
  require("config.gitsigns")
  require("config.nvimtree")
  require("config.lualine")
  require("config.nullls")
end

require("config.packer")
