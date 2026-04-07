vim.g.mapleader = ' '

vim.opt.relativenumber = true

vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})


vim.opt.hlsearch = true
vim.keymap.set('n', '<leader>n', '<cmd>:nohlsearch<CR>')

local function smart_move(dir)
  local curwin = vim.api.nvim_get_current_win()
  local target

  vim.cmd('wincmd ' .. dir:lower())
  target = vim.api.nvim_get_current_win()

  if target == curwin then
    if dir == 'H' or dir == 'L' then
      vim.cmd('vsplit')
    else
      vim.cmd('split')
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

vim.keymap.set('n', '<leader>wH', function() smart_move('H') end, { desc = 'Move window left (or create)' })
vim.keymap.set('n', '<leader>wL', function() smart_move('L') end, { desc = 'Move window right (or create)' })
vim.keymap.set('n', '<leader>wJ', function() smart_move('J') end, { desc = 'Move window down (or create)' })
vim.keymap.set('n', '<leader>wK', function() smart_move('K') end, { desc = 'Move window up (or create)' })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ spec = {
	{ import = "plugins" }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
