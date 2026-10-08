return {
    "neovim/nvim-lspconfig",
    config = function()
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = 'LSP References' })
        vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = 'LSP Definitions' })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
        vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
        vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action , { desc = 'LSP Action' })

        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'LSP Error List' })
        vim.keymap.set('n', 'üg', function() vim.diagnostic.jump({count= -1,float = true}) end)
        vim.keymap.set('n', '+g', function() vim.diagnostic.jump({count= 1,float = true}) end)
        vim.diagnostic.config({ virtual_text = true, signs = false })
    end
}
