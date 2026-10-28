vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand '%:.'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('Cpname', function()
  local path = vim.fn.expand '%:t'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopypathWithLine', function(opts)
  local path_with_line = vim.fn.expand '%:.' .. ':' .. opts.line1
  if opts.line1 ~= opts.line2 then
    path_with_line = path_with_line .. '-' .. opts.line2
  end
  vim.fn.setreg('+', path_with_line)

  vim.notify('Copied "' .. path_with_line .. '" to the clipboard!')
end, { range = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- https://www.reddit.com/r/neovim/comments/1flr88l/comment/lo8yoqh/
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = "if mode() != 'c' | checktime | endif",
})

-- https://www.reddit.com/r/neovim/comments/1qgtu8v/comment/o0ftp97/
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    if vim.bo.buftype == 'help' then
      vim.cmd.wincmd 'T'
    end
  end,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'VimResized' }, {
  callback = function()
    local mode = vim.fn.mode()
    if mode ~= 'i' then
      vim.cmd 'silent! normal! zz'
    end
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.cmd 'silent! wincmd ='
  end,
})
