if vim.g.vscode then
  return {
    vim.keymap.set({'n', 'v'}, '<leader>ii', function()
      require('vscode').action 'claudeVSCodeSidebarSecondary.focus'
    end),
  }
else
  return {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>ii', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', desc = 'Add file', ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' } },

      -- Diff management
      { '<leader>ia', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>id', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  }
end
