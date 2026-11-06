return {
  'theprimeagen/harpoon',
  config = function()
    vim.keymap.set({'n', 'v'}, '<leader>hh', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<CR>')

    vim.keymap.set({'n', 'v'}, '<leader>1', '<cmd>:lua require("harpoon.ui").nav_file(1)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>2', '<cmd>:lua require("harpoon.ui").nav_file(2)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>3', '<cmd>:lua require("harpoon.ui").nav_file(3)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>4', '<cmd>:lua require("harpoon.ui").nav_file(4)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>5', '<cmd>:lua require("harpoon.ui").nav_file(5)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>6', '<cmd>:lua require("harpoon.ui").nav_file(6)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>7', '<cmd>:lua require("harpoon.ui").nav_file(7)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>8', '<cmd>:lua require("harpoon.ui").nav_file(8)<CR>')
    vim.keymap.set({'n', 'v'}, '<leader>9', '<cmd>:lua require("harpoon.ui").nav_file(9)<CR>')
  end,
}
