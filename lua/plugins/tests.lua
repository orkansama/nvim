if vim.g.vscode then
  return {
    vim.keymap.set('n', '<leader>ta', function()
      require('vscode').action 'testing.runAll'
    end),

    vim.keymap.set('n', '<leader>tt', function()
      require('vscode').action 'workbench.view.extension.test'
    end),

    vim.keymap.set('n', '<leader>to', function()
      require('vscode').action 'testing.showMostRecentOutput'
    end),
  }
else
  return {
    -- disable
  }
end
