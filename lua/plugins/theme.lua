  return {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
      require('dracula').setup { styles = {} }
      vim.cmd.colorscheme 'dracula'
    end,
  }
