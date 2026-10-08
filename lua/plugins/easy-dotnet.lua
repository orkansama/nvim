return {
  'GustavEikaas/easy-dotnet.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/snacks.nvim' },
  config = function()
    require('easy-dotnet').setup {
      lsp = {
        enabled = false,
      },
      debugger = {
        console = 'internalConsole',
      },
      test_runner = {
        mappings = {
          debug_test = { lhs = 'td', desc = 'debug test' },
          go_to_file = { lhs = 'ti', desc = 'go to file' },
          next_failure = { lhs = '*g', desc = 'jump to next failing test' },
          prev_failure = { lhs = 'üg', desc = 'jump to previous failing test' },
          run = { lhs = '<leader>r', desc = 'run test' },
          run_all = { lhs = '<leader>R', desc = 'run all tests' },
          cancel = { lhs = 'c', desc = 'cancel in-flight operation' },
          refresh_testrunner = { lhs = 'U', desc = 'refresh testrunner' },
          expand = { lhs = 'o', desc = 'expand' },

          run_test_from_buffer = { lhs = '<leader>tf', desc = 'run test from buffer' },
          run_all_tests_from_buffer = { lhs = '<leader>tr', desc = 'Run all tests in file' },
          get_build_errors = { lhs = '<leader>e', desc = 'get build errors' },
          peek_stack_trace_from_buffer = { lhs = '<leader>p', desc = 'peek stack trace from buffer' },
          debug_test_from_buffer = { lhs = '<leader>d', desc = 'run test from buffer' },
          peek_stacktrace = { lhs = '<leader>p', desc = 'peek stacktrace of failed test' },
          expand_node = { lhs = 'E', desc = 'expand node' },

          close = { lhs = 'q', desc = 'close testrunner' },
          collapse_all = { lhs = 'W', desc = 'collapse all' },
        },
      },
    }

    vim.keymap.set('n', '<leader>tt', '<cmd>Dotnet testrunner<CR>')
  end,
}
