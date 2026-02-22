return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  vim.keymap.set('n', '<leader>hh', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true }),
}
