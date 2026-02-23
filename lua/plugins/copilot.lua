return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    opts = {
      model = 'gpt-4.1', -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float'
        width = 0.3, -- 50% of screen width
      },
      auto_insert_mode = false, -- Enter insert mode when opening
    },

    vim.keymap.set('n', '<leader>ii', '<cmd>CopilotChatToggle<CR>', { desc = 'Toggle Chat Window' }),
  },
}
