if vim.g.vscode then
  return {
    -- disable
  }
else
  return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavor = 'mocha',
      }
      vim.cmd.colorscheme 'catppuccin-nvim'
    end,
  }
end
