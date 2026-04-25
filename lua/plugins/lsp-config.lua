return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim"
    },
    config = function()
        require('mason').setup()
    end
}
