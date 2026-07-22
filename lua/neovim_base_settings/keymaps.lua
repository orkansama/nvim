vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>cp', '<cmd>:Cppath<CR>')

vim.keymap.set('n', '<leader>cn', '<cmd>:Cpname<CR>')

vim.keymap.set('n', '<leader>n', '<cmd>:nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<leader>e', '<cmd>:Ex<CR>')

vim.keymap.set('n', '<M-j>', '<cmd>move .+1<CR>==')

vim.keymap.set('n', '<M-k>', '<cmd>move .-2<CR>==')
