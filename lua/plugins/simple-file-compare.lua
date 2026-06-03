return {
  'orkansama/simple-file-compare.nvim',
  dependencies = {
    -- depending on your needs
    'folke/snacks.nvim',
    'nvim-mini/mini.pick',
  },
  config = function()
    local simpleFileCompare = require 'simple-file-compare'
    simpleFileCompare.setup {
      mode = 'snacks', -- "snacks" | "vimUiSelect" | "miniPick"
    }
  end,

  vim.keymap.set({ 'n', 'v' }, '<leader>zb', '<cmd>:FileCompareOpen<CR>', { desc = 'Compare Current File With Other Branch' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>zc', '<cmd>:FileCompareClose<CR>', { desc = 'Close Branch Comparison' }),
}
