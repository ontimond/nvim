return {
  'neovim/nvim-lspconfig',
  tag = 'v2.5.0',
  init = function()
    vim.lsp.enable('intelephense')
    vim.lsp.enable('clangd')
  end
}
