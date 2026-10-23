return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.add {
        { '<leader>z', group = 'git' },
        { '<leader>d', group = 'debug' },
        { '+', group = 'next' },
        { 'ü', group = 'prev' },
      }

      wk.setup {
        triggers = {
          { '<leader>z', mode = { 'n', 'v' } },
          { '<leader>d', group = 'debug', mode = { 'n', 'v' } },
          { '+', mode = { 'n', 'v' } },
          { 'ü', mode = { 'n', 'v' } },
          { '"', mode = { 'n', 'v' } },
          { "'", mode = { 'n', 'v' } },
        },
      }
    end,
  },
}
