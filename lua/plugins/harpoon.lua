return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  vim.keymap.set('n', '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true, desc = 'harpoon [a]dd to list' }),
  vim.keymap.set('n', '<leader>hh', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true, desc = 'harpoon show list' }),
  vim.keymap.set('n', '<leader>1', '<cmd>:lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true, desc = 'harpoon[1] Jump' }),
  vim.keymap.set('n', '<leader>2', '<cmd>:lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true, desc = 'harpoon[2] Jump' }),
  vim.keymap.set('n', '<leader>3', '<cmd>:lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true, desc = 'harpoon[3] Jump' }),
  vim.keymap.set('n', '<leader>4', '<cmd>:lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true, desc = 'harpoon[4] Jump' }),
  vim.keymap.set('n', '<leader>5', '<cmd>:lua require("harpoon.ui").nav_file(5)<CR>', { noremap = true, silent = true, desc = 'harpoon[5] Jump' }),
  vim.keymap.set('n', '<leader>6', '<cmd>:lua require("harpoon.ui").nav_file(6)<CR>', { noremap = true, silent = true, desc = 'harpoon[6] Jump' }),
  vim.keymap.set('n', '<leader>7', '<cmd>:lua require("harpoon.ui").nav_file(7)<CR>', { noremap = true, silent = true, desc = 'harpoon[7] Jump' }),
  vim.keymap.set('n', '<leader>8', '<cmd>:lua require("harpoon.ui").nav_file(8)<CR>', { noremap = true, silent = true, desc = 'harpoon[8] Jump' }),
  vim.keymap.set('n', '<leader>9', '<cmd>:lua require("harpoon.ui").nav_file(9)<CR>', { noremap = true, silent = true, desc = 'harpoon[9] Jump' }),
}
