return {
  'stevearc/conform.nvim',
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd' },
        cs = { 'csharpier' },
        c = { 'clang-format' },
      },
    }

    vim.keymap.set('n', '<leader>f', function()
      require('conform').format { async = true, lsp_format = 'never' }
    end)
  end,
}
