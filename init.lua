vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.o.inccommand = 'split'
vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>bo', function() vim.cmd('silent! %bd|e#|bd#') end, { desc = 'Close other buffers' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
