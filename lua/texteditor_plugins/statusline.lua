return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local git_blame = require 'gitblame'
      require('lualine').setup {
        options = {
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'filename', 'branch' },
          lualine_c = {
            '%=',
          },
          lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
          lualine_y = { { 'filetype', separator = { right = '' }, left_padding = 2 } },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  {
    {
      'f-person/git-blame.nvim',
      config = function()
        vim.g.gitblame_date_format = '%r'
        vim.g.gitblame_message_when_not_committed = 'Not Commited Yet'
        vim.g.gitblame_display_virtual_text = 0
        vim.g.gitblame_delay = 1
      end,
    },
  },
}
