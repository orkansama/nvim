if vim.g.vscode then
  return {
    -- disable
  }
else
  return {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {},
    config = function()
      require('tree-sitter-manager').setup {
        ensure_installed = { 'c_sharp', 'lua' },
        nohighlight = { 'c_sharp', 'lua' },
      }
    end,
    vim.keymap.set('n', '<leader>xo', function()
      vim.treesitter.inspect_tree()
    end),
  }
end
