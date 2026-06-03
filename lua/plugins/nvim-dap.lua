return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')

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

    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    -- vim.keymap.set('n', '<leader>da', '<cmd>:DapNew Launch<CR>')
    -- vim.keymap.set('n', '<leader>da', '<cmd>:DapDisconnect<CR>')
    end
}
