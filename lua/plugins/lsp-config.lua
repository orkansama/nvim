return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim"
    },
    config = function()
        require('mason').setup()
        require("mason-lspconfig").setup
        {
            ensure_installed = { "lua_ls", "omnisharp" },
            automatic_enable = true,
        }

        -- Keymaps
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = 'LSP References' })
        vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = 'LSP Definitions' })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
        vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
    end
}
