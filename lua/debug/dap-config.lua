return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'nvim-neotest/nvim-nio',
      },
    },
  },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DiagnosticError' })
    vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = 'DiagnosticError' })

    -- fallback means "for all adapters"
    dap.defaults.fallback.terminal_win_cmd = function()
      return vim.api.nvim_create_buf(false, true)
    end

    dapui.setup {
      layouts = {
        {
          elements = {
            { id = 'breakpoints', size = 0.20 },
            { id = 'scopes', size = 0.50 },
          },
          position = 'bottom',
          size = 20,
        },
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

     require 'debug.dap-keymaps'()
  end,
}
