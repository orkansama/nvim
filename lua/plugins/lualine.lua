return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim', 'yavorski/lualine-macro-recording.nvim' },
    config = function()
      function get_last_search_from_register()
        local last_search = vim.fn.getreg '/'
        return last_search
      end

      function check_if_api_session_is_active()
        local debugger_window_name = 'term://.*dotnet'

        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local buf_name = vim.api.nvim_buf_get_name(buf)

          if buf_name:find(debugger_window_name) then
            return true
          end
        end
      end

      function dap_ui_attached()
        if not package.loaded.dap then
          return false
        end

        local session = require('dap').session()
        return session ~= nil
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
            {
              function()
                return ''
              end,
              cond = check_if_api_session_is_active,
              color = 'lualine_c_normal',
            },
            {
              function()
                return ''
              end,
              cond = dap_ui_attached,
              color = 'lualine_c_normal',
            },
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
