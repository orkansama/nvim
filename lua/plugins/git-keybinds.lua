return {
    "LionyxML/gitlineage.nvim",
    config = function()
        require("gitlineage").setup({
            keymap = "nil",
            keys = {
                next_commit = "+c",
                prev_commit = "üc",
            },
        })
    end,

    vim.keymap.set({'n', 'v'}, '<leader>zl', '<cmd>:GitLineage<CR>', { desc = "View Line History" }),

    vim.keymap.set('n', '<leader>zh', function()
        vim.cmd('normal! ggVG')
        vim.cmd("'<,'>GitLineage")
    end, { desc = 'View File History' }),

    vim.keymap.set({'n', 'v'}, '<leader>zb', function()
        local branchName = vim.fn.input("Enter branch: ")
        local fileName = vim.fn.bufname("%")
        vim.cmd("terminal git difftool " .. branchName .. " -- " ..fileName.."")
    end, { desc = "Compare Current File With Other Branch" }),
}
