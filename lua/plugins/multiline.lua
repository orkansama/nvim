return {
  'mg979/vim-visual-multi',
  branch = 'master',
  vim.keymap.set('n', '<leader>ln', '<Plug>(VM-Find-Under)', {}),
  vim.keymap.set('n', '<leader>la', '<Plug>(VM-Select-All)', {}),
}
