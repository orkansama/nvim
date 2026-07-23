if vim.g.vscode then
  return {
    vim.keymap.set({'n', 'v'}, '<leader>da', function()
      require('vscode').action 'workbench.action.debug.start'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>ds', function()
      require('vscode').action 'workbench.action.debug.stop'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>db', function()
      require('vscode').action 'editor.debug.action.toggleBreakpoint'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>dr', function()
      require('vscode').action 'workbench.debug.viewlet.action.removeAllBreakpoints'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>di', function()
      require('vscode').action 'workbench.action.debug.stepInto'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>do', function()
      require('vscode').action 'workbench.action.debug.stepOver'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>de', function()
      require('vscode').action 'workbench.action.debug.stepOut'
    end),

    vim.keymap.set({'n', 'v'}, '<leader>dk', function()
      require('vscode').action 'editor.debug.action.showDebugHover'
    end),
  }
else
  return {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = { '--interpreter=vscode' },
      }

      dap.configurations.cs = {
        {
          name = '.NET Aspire (AppHost)',
          type = 'coreclr',
          request = 'launch',
          program = 'dotnet',
          args = {
            'run',
            '--project',
            '${workspaceFolder}/CL.API.AppHost',
            '--launch-profile',
            'https',
          },
          cwd = '${workspaceFolder}/CL.API.AppHost',
          stopAtEntry = false,
        },
      }

      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function()
        require('dap').step_over()
      end)
      vim.keymap.set('n', '<F11>', function()
        require('dap').step_into()
      end)
      vim.keymap.set('n', '<F12>', function()
        require('dap').step_out()
      end)
      vim.keymap.set('n', '<Leader>b', function()
        require('dap').toggle_breakpoint()
      end)
      -- vim.keymap.set('n', '<leader>da', '<cmd>:DapNew Launch<CR>')
      -- vim.keymap.set('n', '<leader>da', '<cmd>:DapDisconnect<CR>')
    end,
  }
end
