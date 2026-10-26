return function()
  local dap = require 'dap'
  local dapui = require 'dapui'

  function attachDebugger()
    vim.cmd 'Dotnet debug attach'
  end

  function startApplication()
    vim.cmd 'rightbelow 10new'
    local startApplication_terminal_win = vim.api.nvim_get_current_win()
    startApplication_terminal_job = vim.fn.jobstart('dotnet run --project *.AppHost', {
      term = true,
      on_stdout = function(_, data)
        if table.concat(data):find('Distributed application started', 1, true) then
          vim.wait(2000)
          attachDebugger()

          if vim.api.nvim_win_is_valid(startApplication_terminal_win) then
            vim.api.nvim_win_close(startApplication_terminal_win, { force = true })
          end
        end
      end,
    })
  end

  function killApplication()
    if startApplication_terminal_job then
      vim.fn.chansend(startApplication_terminal_job, '\x03')
      startApplication_terminal_job = nil

      for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buffer):find 'term' then
          vim.api.nvim_buf_delete(buffer, { force = true })
        end
      end
    end

    dap.terminate()
  end

  local nvimCmdContainsApi = vim.fn.getcwd():find('api', 1, true)

  if nvimCmdContainsApi then
    vim.keymap.set('n', '<leader>da', function()
      if startApplication_terminal_job and not dap.session() then
        attachDebugger()
      elseif startApplication_terminal_job then
        dap.continue()
      else
        startApplication()
      end
    end, { desc = 'Debug: Start/Continue' })

    vim.keymap.set('n', '<leader>ds', function()
      killApplication()
    end, { desc = 'Debug: Kill Application and quit Debugger' })
  else
    vim.keymap.set('n', '<leader>da', function()
      dap.continue()
    end, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>ds', function()
      dap.terminate()
    end, { desc = 'Debug: Stop/Terminate' })
  end

  vim.keymap.set('n', '<leader>dr', function()
    dap.clear_breakpoints()
  end, { desc = 'Debug: Remove all Breakpoints' })

  vim.keymap.set('n', '<leader>db', function()
    dap.toggle_breakpoint()
  end, { desc = 'Debug: Toggle Breakpoint' })

  vim.keymap.set('n', '<leader>di', function()
    dap.step_into()
  end, { desc = 'Debug: Step Into' })
  vim.keymap.set('n', '<leader>do', function()
    dap.step_over()
  end, { desc = 'Debug: Step Over' })
  vim.keymap.set('n', '<leader>de', function()
    dap.step_out()
  end, { desc = 'Debug: Step Out' })

  vim.keymap.set({ 'n', 'v' }, '<Leader>dk', function()
    require('dap.ui.widgets').hover()
  end, { desc = 'Debug: Hover' })

  vim.keymap.set({ 'n', 'v' }, '<Leader>dd', function()
    dapui.toggle()
  end, { desc = 'Debug: Hover' })
end
