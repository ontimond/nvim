local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
  update_interval = 100,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
     vim.api.nvim_command("colorscheme " .. dark_theme)
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
     vim.api.nvim_command("colorscheme " .. light_theme)
  end,
})

auto_dark_mode.init()
