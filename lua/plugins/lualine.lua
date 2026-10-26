return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim', 'yavorski/lualine-macro-recording.nvim' },
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
          refresh = {
            tabline = 1,
          },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
          },
          lualine_b = {
            { 'branch' },
          },
          lualine_c = {
            '%=',
          },
          lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available, color = { fg = 'white' } },
          },
          lualine_y = {
            { 'macro_recording' },
            { get_last_search_from_register, icon = { ' =' }, color = { fg = '#a6e3a1', gui = 'bold' } },
            { 'searchcount', color = { fg = '#a6e3a1', gui = 'bold' }, padding = { left = 0 } },
            {
              'lsp_status',
              icon = '',
              symbols = {
                spinner = {},
                done = '',
                separator = ' | ',
              },
              ignore_lsp = { 'stylua' },
              show_name = true,
            },
            { 'diagnostics' },
            { 'filetype', separator = { right = '' }, left_padding = 2 },
          },
          lualine_z = {},
        },
        tabline = {
          lualine_c = {
            '%=',
            {
              'filename',
              path = 1,
            },
          },
        },
        extensions = {},
      }
    end,
  },
}
