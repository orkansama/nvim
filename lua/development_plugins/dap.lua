return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'

    if vim.fn.getcwd():find("api", 1, true) then
        local apphost_job
        vim.keymap.set('n', '<leader>da', function()
            vim.cmd("rightbelow 10new")
            apphost_job = vim.fn.jobstart("dotnet run --project *.AppHost", {
              term = true,
              on_stdout = function(_, data)
                if table.concat(data):find("Distributed application started", 1, true) then
                  vim.wait(2000)
                  vim.cmd("Dotnet debug attach")
                end
              end,
            })
        end, { desc = 'Debug: Start/Continue AppHost' })
        vim.keymap.set('n', '<leader>ds', function()
            if apphost_job then vim.fn.chansend(apphost_job, "\x03") end
            dap.terminate()

             for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_get_name(buffer):find('term') then
                  vim.api.nvim_buf_delete(buffer, { force = true })
                end
              end
        end, { desc = 'Debug: Ctrl+C AppHost and Terminate debugger' })
    else
        vim.keymap.set('n', '<leader>da', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<leader>ds', function() dap.terminate() end, { desc = 'Debug: Stop/Terminate' })
    end

    vim.keymap.set("n", "<leader>dr", function() dap.clear_breakpoints() end, { desc = "Debug: Remove all Breakpoints" })
    vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })

    vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>de', function() dap.step_out() end, { desc = 'Debug: Step Out' })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "DiagnosticError" })

    local dapui = require 'dapui'
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

    -- fallback means "for all adapters"
    dap.defaults.fallback.terminal_win_cmd = function()
      return vim.api.nvim_create_buf(false, true)
    end

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
  end,
}
