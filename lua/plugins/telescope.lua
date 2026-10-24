return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require 'telescope.builtin'
      local sorter = require 'telescope.sorters'
      local themes = require 'telescope.themes'

      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Find Files' })
      vim.keymap.set('n', '<leader>sc', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.buffers, { desc = 'Search Open Buffers' })
      vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = 'Search Current Buffer' })

      vim.keymap.set('n', '<leader>sr', function()
        builtin.oldfiles(themes.get_dropdown {
          only_cwd = true,
        })
      end, { desc = 'Search Recent Files' })

      vim.keymap.set('n', '<leader>sm', function()
        builtin.treesitter {
          sorter = sorter.get_substr_matcher(),
          prompt_title = 'Treesitter (Sorted by Line Number)',
        }
      end, { desc = 'Treesitter symbols by line number' })

      vim.keymap.set('n', '<leader>sg', function()
        builtin.live_grep { additional_args = { '--fixed-strings' } }
      end, { desc = 'Search Live Grep' })

      vim.keymap.set('n', '<leader>sh', function()
        builtin.help_tags {
          layout_strategy = 'vertical',
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
        }
      end, { desc = 'Search Help Pages' })

      vim.keymap.set({ 'n', 'v' }, '<leader>ss', function()
        require('telescope.builtin').grep_string { word_match = '-w' }
      end, { desc = 'Find exact word under cursor' })
    end,
  },
}
