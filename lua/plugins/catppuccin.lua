return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      no_italic = true,
      no_bold = true,
      no_underline = false,
      integrations = {
        lualine = {
          all = function(colors)
            return {
              normal = { c = { bg = colors.base, fg = colors.mauve } },
            }
          end,
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
