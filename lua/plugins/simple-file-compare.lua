return {
  'orkansama/simple-file-compare.nvim',
  dependencies = {
    -- depending on your needs
    'folke/snacks.nvim',
    'nvim-mini/mini.pick',
  },
  config = function()
    local simpleFileCompare = require('simple-file-compare')
    simpleFileCompare.setup({
      mode = 'snacks', -- "snacks" | "vimUiSelect" | "miniPick"
    })
  end,
}
