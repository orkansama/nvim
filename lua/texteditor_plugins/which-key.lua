return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.add {
        { '<leader>z', group = 'git' },
      }

      wk.setup {
        triggers = {
          { '<leader>z', mode = { 'n', 'v' } },
          { '"', mode = { 'n', 'v' } },
          { "'", mode = { 'n', 'v' } },
        },
      }
    end,
  },
}
