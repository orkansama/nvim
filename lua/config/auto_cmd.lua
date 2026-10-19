vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('Cpname', function()
  local path = vim.fn.expand '%:t'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'VimResized' }, {
  group = vim.api.nvim_create_augroup('SimpleZoomCenter', { clear = true }),
  callback = function()
    vim.cmd 'normal! zz'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- https://www.reddit.com/r/neovim/comments/1flr88l/comment/lo8yoqh/
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})
