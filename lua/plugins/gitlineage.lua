if vim.g.vscode then
  return {
    vim.keymap.set('n', '+c', function()
      require('vscode').action 'workbench.action.editor.nextChange'
    end, { desc = 'Go To Next Change' }),

    vim.keymap.set('n', 'üc', function()
      require('vscode').action 'workbench.action.editor.previousChange'
    end, { desc = 'Go To Prev Change' }),

    vim.keymap.set('n', '<leader>zl', function()
      require('vscode').action 'githd.viewLineHistory'
    end, { desc = 'View Line History' }),

    vim.keymap.set('n', '<leader>zh', function()
      require('vscode').action 'githd.viewFileHistory'
    end, { desc = 'View File History' }),
  }
else
  return {
    'LionyxML/gitlineage.nvim',
    config = function()
      require('gitlineage').setup {
        keys = {
          next_commit = '+c',
          prev_commit = 'üc',
        },
      }
    end,

    vim.keymap.set({ 'n', 'v' }, '<leader>zl', '<cmd>:GitLineage<CR>', { desc = 'View Line History' }),

    vim.keymap.set('n', '<leader>zh', function()
      vim.cmd '%GitLineage'
    end, { desc = 'View File History' }),
  }
end
