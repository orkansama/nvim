return {
    "echasnovski/mini.nvim",
    config = function()
        local statusline = require('mini.statusline')
        local miniComment = require('mini.comment')

        statusline.setup { use_icons = vim.g.have_nerd_font }
        statusline.section_location = function()
          return '%2l:%-2v'
        end

        miniComment.setup {
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
    end
}
