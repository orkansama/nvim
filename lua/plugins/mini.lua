if vim.g.vscode then
  return {
    vim.keymap.set('n', '<C-#>', function()
      require('vscode').action 'editor.action.commentLine'
    end),
  }
else
  return {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup()

      local miniComment = require 'mini.comment'
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
    end,
  }
end
