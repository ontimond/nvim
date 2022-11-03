-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    float = {
      enable = true,
    }
  },
})

vim.keymap.set("n", "<leader>o", ":NvimTreeFindFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", { silent = true })

-- Close nvim if the only window left is the nvim-tree
vim.cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])
 -- vim.cmd("hi NvimTreeNormal guibg=transparent")
-- vim.api.nvim_set_hl("NvimTreeNormal", "Normal", {})
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=transparent")
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
