local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
packer_installed = not (fn.empty(fn.glob(install_path)) > 0)
