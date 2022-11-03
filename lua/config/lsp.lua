local capabilities = require("cmp_nvim_lsp").default_capabilities()
local saga = require('lspsaga')
local keymap = vim.keymap.set


saga.init_lsp_saga()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
  keymap("n", "rn", "<cmd>Lspsaga rename<CR>", bufopts)
  keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
  -- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  keymap("n", "<A-t>", "<cmd>Lspsaga open_floaterm<CR>", bufopts)
  keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })


  keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,

  ["sumneko_lua"] = function()
    require("lspconfig")["sumneko_lua"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end

}
