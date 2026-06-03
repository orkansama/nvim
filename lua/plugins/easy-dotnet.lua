return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'folke/snacks.nvim',
  },
  config = function()
    local dotnet = require("easy-dotnet")
    dotnet.setup({
      external_terminal = nil,
      lsp = {
        enabled = false, -- Enable builtin roslyn lsp
      },

      vim.keymap.set('n', '<leader>tt', '<cmd>:Dotnet testrunner<CR>'),
      ---@type TestRunnerOptions
      test_runner = {
        auto_start_testrunner = true,
        icons = {
          passed = "",
          skipped = "",
          failed = "",
          success = "",
          reload = "",
          test = "",
          sln = "󰘐",
          project = "󰘐",
          dir = "",
          package = "",
          class = "",
          build_failed = "󰒡",
        },
        mappings = {
          -- buffer
          run_all_tests_from_buffer = { lhs = "<leader>tf", desc = "Run all tests in file" },
          debug_test = { lhs = "<leader>td", desc = "debug test" },
          go_to_file = { lhs = "<leader>gi", desc = "go to file" },
          run_all = { lhs = "<leader>ta", desc = "run all tests" },
          run = { lhs = "<leader>tr", desc = "run test" },
          peek_stacktrace = { lhs = "<leader>q", desc = "peek stacktrace of failed test" },

          expand = { lhs = "o", desc = "expand" },
          expand_node = { lhs = "E", desc = "expand node" },
          collapse_all = { lhs = "W", desc = "collapse all" },
          close = { lhs = "q", desc = "close testrunner" },
          refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
          cancel = { lhs = "<C-c>", desc = "cancel in-flight operation" },
        }
      },
      new = {
        project = {
          prefix = "sln"
        }
      },
      csproj_mappings = true,
      fsproj_mappings = true,
      auto_bootstrap_namespace = {
          type = "block_scoped",
          enabled = true,
          use_clipboard_json = {
            behavior = "prompt",
            register = "+",
          },
      },
      server = {
          ---@type nil | "Off" | "Critical" | "Error" | "Warning" | "Information" | "Verbose" | "All"
          log_level = nil,
      },
      -- choose which picker to use with the plugin
      -- possible values are "telescope" | "fzf" | "snacks" | "basic"
      -- if no picker is specified, the plugin will determine
      -- the available one automatically with this priority:
      --  snacks -> fzf -> telescope ->  basic
      picker = "telescope",
    })
  end
}
