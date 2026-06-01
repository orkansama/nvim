return {
  {
    dir = '~/simple-file-compare.nvim',
    config = function()
      local plugin = require 'simple-file-compare'
      plugin.setup()
    end,
  },
}
