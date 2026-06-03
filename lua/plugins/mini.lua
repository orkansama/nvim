return {
    "echasnovski/mini.nvim",
    config = function()
        require('mini.statusline').setup()

        local miniComment = require('mini.comment')
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
