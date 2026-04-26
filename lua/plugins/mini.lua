return {
    "echasnovski/mini.nvim",
    config = function()
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
    end
}
