if vim.g.vscode then
  return {
    -- disable
    vim.keymap.set('n', '<leader>sc', function()
      require('vscode').action 'code-telescope.fuzzy.resume'
    end),

    vim.keymap.set('n', '<leader>sb', function()
      require('vscode').action 'code-telescope.fuzzy.fileText'
    end),

    vim.keymap.set('n', '<leader>sf', function()
      require('vscode').action 'code-telescope.fuzzy.file'
    end),

    vim.keymap.set('n', '<leader>sg', function()
      require('vscode').action 'code-telescope.fuzzy.wsText'
    end),

    vim.keymap.set('n', '<leader>sw', function()
      require('vscode').action 'nice-finder.searchContent'
    end),

    vim.keymap.set('n', '<leader>sm', function()
      require('vscode').action 'code-telescope.fuzzy.documentSymbols'
    end),
  }
else
  return {
    {
      'nvim-telescope/telescope.nvim',
      version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Find Files' })
        vim.keymap.set('n', '<leader>sm', builtin.treesitter, { desc = 'Search Find Files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search Live Grep' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help Pages' })
        vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = 'Search Current Buffer' })
        vim.keymap.set('n', '<leader>sc', builtin.resume, { desc = 'Search Current Buffer' })
      end,
    },
  }
end

