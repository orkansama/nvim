return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nsidorenco/neotest-vstest',
  },

  -- IMPORTANT: U NEED TO MAKE TSInstall {language} for this to work
  -- TSInstall c_sharp
  config = function()
    require('neotest').setup {
      adapters = {
        require('neotest-vstest'),
      },
    }
  end,
}
