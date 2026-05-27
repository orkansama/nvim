return {
    vim.keymap.set({'n', 'v'}, '<leader>vh', '<cmd>:diffget LOCAL<CR>', { desc = "Take Local Changes" }),
    vim.keymap.set({'n', 'v'}, '<leader>vl', '<cmd>:diffget REMOTE<CR>', { desc = "Take Remote Changes" }),
    vim.keymap.set({'n', 'v'}, '<leader>vr', '<cmd>:diffget BASE<CR>', { desc = "Take Base Changes" }),
    vim.keymap.set({'n', 'v'}, '<leader>vc', '<cmd>:cq<CR>', { desc = "Abort Merge" }),
}
