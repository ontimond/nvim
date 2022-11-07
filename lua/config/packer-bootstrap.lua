local fn = vim.fn local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
packer_installed = not (fn.empty(fn.glob(install_path)) > 0)

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
packer_bootstrap = ensure_packer()
