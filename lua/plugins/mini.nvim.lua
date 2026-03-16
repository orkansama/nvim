return {
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.comment').setup {
      hooks = {
        post = function()
          vim.cmd 'normal! gv'
        end,
      },
      mappings = {
        comment_line = '<C-#>',
        comment_visual = '<C-#>',
      },
    }
  end,
}
