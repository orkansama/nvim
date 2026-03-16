return {
  'mg979/vim-visual-multi',
  branch = 'master',
  vim.keymap.set('n', '<leader>ln', '<Plug>(VM-Find-Under)', { desc = 'Select [N]ext [L]ine Occurrence' }),
  vim.keymap.set('n', '<leader>la', '<Plug>(VM-Select-All)', { desc = 'Select [A]ll [L]ine Occurrence' }),
}
