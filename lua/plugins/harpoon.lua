return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  vim.keymap.set('n', '<leader>hh', 'require("harpoon.ui").toggle_quick_menu()', { noremap = true, silent = true }),
}
