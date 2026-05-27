return {
    vim.keymap.set({'n', 'v'}, '<leader>zb', function()
        local branchName = vim.fn.input("Enter branch: ")
        local fileName = vim.fn.bufname("%")
        vim.cmd("terminal git difftool " .. branchName .. " -- " ..fileName.."")
    end, { desc = "Compare Current File With Other Branch" }),
}
