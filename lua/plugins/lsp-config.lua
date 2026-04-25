return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim"
    },
    servers = {"lua_ls"};
    config = function()
        require('mason').setup()
        require("mason-lspconfig").setup
        {
            ensure_installed = { "lua_ls" },
            automatic_enable = true,
        }
        vim.lsp.config("*", { })
    end
}
