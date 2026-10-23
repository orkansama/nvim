return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim' },
    config = function()
      function get_last_search_from_register()
        local last_search = vim.fn.getreg '/'
        return last_search
      end

      local git_blame = require 'gitblame'
      require('lualine').setup {
        options = {
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {
            { 'filename' },
            { 'branch' },
          },
          lualine_c = {
            '%=',
          },
          lualine_x = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
          lualine_y = {
            { get_last_search_from_register, icon = { ' =' }, color = { fg = '#a6e3a1', gui = 'bold' } },
            { 'searchcount', color = { fg = '#a6e3a1', gui = 'bold' }, padding = { left = 0 } },
            {
              'lsp_status',
              icon = '',
              symbols = {
                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                done = '',
                separator = ' | ',
              },
              ignore_lsp = {},
              show_name = true,
            },
            { 'diagnostics' },
            { 'filetype', separator = { right = '' }, left_padding = 2 },
          },
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
}
