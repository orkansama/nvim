return {
  'LionyxML/gitlineage.nvim',
  config = function()
    require('gitlineage').setup {
      keys = {
        next_commit = '+c',
        prev_commit = 'üc',
      },
    }
  end,

  vim.keymap.set({ 'n', 'v' }, '<leader>zl', '<cmd>:GitLineage<CR>', { desc = 'View Line History' }),

  vim.keymap.set('n', '<leader>zh', function()
    vim.cmd("%GitLineage")
  end, { desc = 'View File History' }),
}
