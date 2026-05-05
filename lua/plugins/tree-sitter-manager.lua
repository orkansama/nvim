return {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
        require("tree-sitter-manager").setup({
            ensure_installed = {"c_sharp", "lua"},
            nohighlight = {"c_sharp", "lua"},
        })
    end
}
