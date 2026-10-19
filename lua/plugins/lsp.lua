local plugins = {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'neovim/nvim-lspconfig', dependencies = { 'nvim-telescope/telescope.nvim' } },
      { 'owallb/mason-auto-install.nvim' },
    },
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'
      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          cs = { 'csharpier' },
        },
      }
    end,
  },
}

local telescope = require 'telescope.builtin'
vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = 'LSP References' })
vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = 'LSP Definitions' })

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { desc = 'LSP Action' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'LSP Error List' })
vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'never' }
end)

-- Misc
vim.keymap.set('n', '+g', function()
  vim.diagnostic.jump { count = 1, float = true }
  vim.cmd 'normal! zz'
end, { desc = 'Next Error' })

vim.keymap.set('n', 'üg', function()
  vim.diagnostic.jump { count = -1, float = true }
  vim.cmd 'normal! zz'
end, { desc = 'Prev Error' })

vim.diagnostic.config {
  virtual_text = true,
  signs = false,
  underline = true,
}

vim.lsp.semantic_tokens.enable(false)
---

return plugins
