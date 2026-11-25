-- Split move
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Focus left window' })

vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Focus right window' })

vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Focus lower window' })

vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Focus upper window' })

-- Split create
vim.keymap.set('n', '<leader>wH', function()
  vim.cmd 'leftabove vsplit'
end, { desc = 'Create left window' })

vim.keymap.set('n', '<leader>wL', function()
  vim.cmd 'rightbelow vsplit'
end, { desc = 'Create right window' })

vim.keymap.set('n', '<leader>wJ', function()
  vim.cmd 'belowright split'
end, { desc = 'Create lower window' })

vim.keymap.set('n', '<leader>wK', function()
  vim.cmd 'aboveleft split'
end, { desc = 'Create upper window' })

vim.keymap.set('n', '<leader>w<', '<cmd>vertical resize -20<CR>', { desc = 'Shrink window width' })

vim.keymap.set('n', '<leader>w>', '<cmd>vertical resize +20<CR>', { desc = 'Increase window width' })

vim.keymap.set('n', '<leader>w+', '<cmd>horizontal resize -20<CR>', { desc = 'Shrink horizontal window' })

vim.keymap.set('n', '<leader>w-', '<cmd>horizontal resize +20<CR>', { desc = 'Increase horizontal window' })

vim.keymap.set('n', '<leader>w0', '<cmd>wincmd =<CR>', { desc = 'Make all Windows equall' })

vim.keymap.set('n', '<leader>wr', function()
  vim.cmd 'silent! %bd|e#|bd#'
end, { desc = 'Close other buffers' })

vim.keymap.set('n', '<leader>wc', ':windo diffthis<CR>')

vim.keymap.set('x', '<leader>wC', function()
  vim.cmd 'normal! "zy'
  local sel = vim.fn.getreg 'z'
  local clip = vim.fn.getreg '+'
  local ft = vim.bo.filetype

  local function scratch(text)
    local buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].filetype = ft
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(text, '\n', { plain = true }))
    vim.cmd 'diffthis'
  end

  vim.cmd 'tabnew'
  scratch(sel)
  vim.cmd 'vnew'
  scratch(clip)
end, { desc = 'Diff selection with clipboard' })
