vim.g.mapleader = ' '

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})


vim.opt.hlsearch = true
vim.keymap.set('n', '<leader>n', '<cmd>:nohlsearch<CR>')
