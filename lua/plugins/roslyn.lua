if vim.g.vscode then
  return {
    -- disable
  }
else
  return {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  }
end
