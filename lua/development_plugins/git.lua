local plugins = {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'
      gitsigns.setup {
        signs = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        signs_staged = {
          add = { text = '┃' },
          change = { text = '┃' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        watch_gitdir = {
          enable = true,
          follow_files = true,
        },
        attach_to_untracked = true,
        sign_priority = 1,
        update_debounce = 100,
        status_formatter = nil, -- Use default
      }
    end,
  },
  {
    'LionyxML/gitlineage.nvim',
    config = function()
      require('gitlineage').setup {
        keys = {
          next_commit = '+c',
          prev_commit = 'üc',
        },
      }
    end,
  },
  {
    {
      'f-person/git-blame.nvim',
      config = function()
        vim.g.gitblame_date_format = '%r'
        vim.g.gitblame_message_when_not_committed = 'Not Commited Yet'
        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_delay = 1
      end,
    },
  },
  {
    'orkansama/simple-file-compare.nvim',
    dependencies = {
      -- depending on your needs
      'folke/snacks.nvim',
      'nvim-mini/mini.pick',
    },
    config = function()
      local simpleFileCompare = require 'simple-file-compare'
      simpleFileCompare.setup {
        mode = 'snacks', -- "snacks" | "vimUiSelect" | "miniPick"
      }
    end,
  },
}

vim.keymap.set({ 'n' }, '<leader>zl', '<cmd>GitLineage <CR>', { desc = 'View Line History' })
vim.keymap.set({ 'v' }, '<leader>zl', ':GitLineage<CR>', { desc = 'View Line History' })
vim.keymap.set('n', '<leader>zh', '<cmd>%GitLineage<CR>', { desc = 'View File History' })

vim.keymap.set({ 'n', 'v' }, '<leader>zb', '<cmd>:FileCompareOpen<CR>', { desc = 'Compare Current File With Other Branch' })
vim.keymap.set({ 'n', 'v' }, '<leader>zc', '<cmd>:FileCompareClose<CR>', { desc = 'Close Branch Comparison' })

vim.keymap.set('n', '+c', '<cmd>Gitsigns nav_hunk next<CR>', { desc = 'Go to next Hunk' })
vim.keymap.set('n', 'üc', '<cmd>Gitsigns nav_hunk prev<CR>', { desc = 'Go to previous Hunk' })

return plugins
