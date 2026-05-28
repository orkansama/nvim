return {
    "stevearc/conform.nvim",
        config = function ()
        local conform = require("conform");
        conform.require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        })


        vim.keymap.set('n', conform.format({ async = true, lsp_format = "never" }), '<cmd>:Cppath<CR>')
    end
}
