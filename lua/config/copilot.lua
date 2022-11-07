vim.defer_fn(function()
  require("copilot").setup()
  require("copilot_cmp").setup {
    plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
  }
end, 100)
