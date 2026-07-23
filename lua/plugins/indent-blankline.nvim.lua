if vim.g.vscode then
  return {
    -- disable
  }
else
  return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup()
    end,
  }
end
