vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>cp', '<cmd>:Cppath<CR>')

vim.keymap.set('n', '<leader>cn', '<cmd>:Cpname<CR>')

vim.keymap.set('n', '<Esc>', '<cmd>:nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

vim.keymap.set({ 'v', 'n' }, '<leader>/', '/\\u<CR>', { silent = true })

vim.keymap.set('n', '<C-o>', '<C-o>zz', { silent = true })
vim.keymap.set('n', '<C-i>', '<C-i>zz', { silent = true })

vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })

vim.keymap.set('n', 'g;', 'g;zz', { silent = true })
vim.keymap.set('n', 'g,', 'g,zz', { silent = true })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- https://www.reddit.com/r/neovim/comments/1707ppd/anybody_actually_use_ctrld_and_ctrlu_to_scroll/
-- thanks mr u/yendreij!
local function lazykeys(keys)
  keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
  return function()
    local old = vim.o.lazyredraw
    vim.o.lazyredraw = true
    vim.api.nvim_feedkeys(keys, 'nx', false)
    vim.o.lazyredraw = old
  end
end
vim.keymap.set('n', '<c-d>', lazykeys '<c-d>zz', { noremap = true, silent = true })

vim.keymap.set('n', '}', '}zz', { silent = true })
vim.keymap.set('n', '{', '{zz', { silent = true })

vim.keymap.set('n', ')', ')zz', { silent = true })
vim.keymap.set('n', '(', '(zz', { silent = true })
