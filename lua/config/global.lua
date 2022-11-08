keymap = vim.keymap.set
fn = vim.fn

-- Packer global
packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
packer_installed = not (fn.empty(fn.glob(packer_install_path)) > 0)

-- Theme global
dark_theme = 'github_dark'
light_theme = 'github_light'
