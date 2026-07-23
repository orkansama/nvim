if vim.g.vscode then
  return {
    vim.keymap.set('n', '<leader>hh', function()
      require('vscode').action 'code-telescope.fuzzy.harpoon'
    end),

    vim.keymap.set('n', '<leader>ha', function()
      require('vscode').action 'code-telescope.harpoon.addFile'
    end),

    vim.keymap.set('n', '<leader>hr', function()
      require('vscode').action 'code-telescope.harpoon.clear'
    end),

    vim.keymap.set('n', '<leader>1', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile1'
    end),

    vim.keymap.set('n', '<leader>2', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile2'
    end),

    vim.keymap.set('n', '<leader>3', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile3'
    end),

    vim.keymap.set('n', '<leader>4', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile4'
    end),

    vim.keymap.set('n', '<leader>5', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile5'
    end),

    vim.keymap.set('n', '<leader>6', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile6'
    end),

    vim.keymap.set('n', '<leader>7', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile7'
    end),

    vim.keymap.set('n', '<leader>8', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile8'
    end),

    vim.keymap.set('n', '<leader>9', function()
      require('vscode').action 'code-telescope.harpoon.gotoFile9'
    end),
  }
else
  return {
    'theprimeagen/harpoon',
    config = function()
      vim.keymap.set('n', '<leader>hh', '<cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>')
      vim.keymap.set('n', '<leader>ha', '<cmd>:lua require("harpoon.mark").add_file()<CR>')

      vim.keymap.set('n', '<leader>1', '<cmd>:lua require("harpoon.ui").nav_file(1)<CR>')
      vim.keymap.set('n', '<leader>2', '<cmd>:lua require("harpoon.ui").nav_file(2)<CR>')
      vim.keymap.set('n', '<leader>3', '<cmd>:lua require("harpoon.ui").nav_file(3)<CR>')
      vim.keymap.set('n', '<leader>4', '<cmd>:lua require("harpoon.ui").nav_file(4)<CR>')
      vim.keymap.set('n', '<leader>5', '<cmd>:lua require("harpoon.ui").nav_file(5)<CR>')
      vim.keymap.set('n', '<leader>6', '<cmd>:lua require("harpoon.ui").nav_file(6)<CR>')
      vim.keymap.set('n', '<leader>7', '<cmd>:lua require("harpoon.ui").nav_file(7)<CR>')
      vim.keymap.set('n', '<leader>8', '<cmd>:lua require("harpoon.ui").nav_file(8)<CR>')
      vim.keymap.set('n', '<leader>9', '<cmd>:lua require("harpoon.ui").nav_file(9)<CR>')
    end,
  }
end
