local function smart_move(dir)
  local curwin = vim.api.nvim_get_current_win()
  local target

  vim.cmd('wincmd ' .. dir:lower())
  target = vim.api.nvim_get_current_win()

  if target == curwin then
    if dir == 'H' or dir == 'L' then
      vim.cmd 'vsplit'
    else
      vim.cmd 'split'
    end
  else
    vim.api.nvim_set_current_win(curwin)
  end

  vim.cmd('wincmd ' .. dir)
end

vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Focus left window' })

vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Focus right window' })

vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Focus lower window' })

vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Focus upper window' })

vim.keymap.set('n', '<leader>wH', function()
  smart_move 'H'
end, { desc = 'Move window left (or create)' })

vim.keymap.set('n', '<leader>wL', function()
  smart_move 'L'
end, { desc = 'Move window right (or create)' })

vim.keymap.set('n', '<leader>wJ', function()
  smart_move 'J'
end, { desc = 'Move window down (or create)' })

vim.keymap.set('n', '<leader>wK', function()
  smart_move 'K'
end, { desc = 'Move window up (or create)' })

vim.keymap.set('n', '<leader>wr', function()
  vim.cmd 'silent! %bd|e#|bd#'
end, { desc = 'Close other buffers' })
