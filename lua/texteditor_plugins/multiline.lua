return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    vim.g.VM_user_operators = { 'gc' }
  end,
  vim.keymap.set({ 'n', 'v' }, '<leader>ln', '<Plug>(VM-Find-Under)', { desc = 'Select next occurrence' }),
  vim.keymap.set({ 'n', 'v' }, '<leader>la', '<Plug>(VM-Visual-All)', { desc = 'Select all occurrences' }),

  vim.keymap.set('x', '<leader>lc', function()
    return '*:g//norm ' .. (math.abs(vim.fn.line 'v' - vim.fn.line '.') + 1) .. 'gcc<CR>'
  end, { expr = true, remap = true, desc = 'Comment visual mode occurrences' }),

  vim.g.VM_theme == 'iceblue',
}
