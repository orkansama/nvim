return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim"
    },
    config = function()
        require('mason').setup({
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            },
        })
        require("mason-lspconfig").setup
        {
            -- For new LSP's, just expand this list.
            ensure_installed = { "lua_ls" }, -- Sadly roslyn does not work with mason-lspconfig :(
            automatic_enable = true,
        }

        -- Manually configuring and enabling roslyn
        vim.lsp.config("roslyn", {})
        vim.lsp.enable("roslyn")

        -- Keymaps
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>gr', telescope.lsp_references, { desc = 'LSP References' })
        vim.keymap.set('n', '<leader>gd', telescope.lsp_definitions, { desc = 'LSP Definitions' })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover' })
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = 'LSP implementation' })
        vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
        vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action , { desc = 'LSP Action' })

        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'LSP Error List' })
        vim.diagnostic.config({ virtual_text = true, signs = false })
        vim.keymap.set('n', 'üg', function() vim.diagnostic.jump({count= -1,float = true}) end)
        vim.keymap.set('n', '+g', function() vim.diagnostic.jump({count= 1,float = true}) end)
    end
}
