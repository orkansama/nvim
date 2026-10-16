return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    config = function()
      vim.keymap.set({ 'x', 'o' }, 'af', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, '+m', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
        vim.cmd 'normal! zz'
      end, { desc = 'Tresitter: Next Function' })
      vim.keymap.set({ 'n', 'x', 'o' }, 'üm', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
        vim.cmd 'normal! zz'
      end, { desc = 'Tresitter: Prev Function' })

      vim.keymap.set({ 'n', 'x', 'o' }, '+d', function()
        require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
        vim.cmd 'normal! zz'
      end, { desc = 'Tresitter: Next Conditional' })
      vim.keymap.set({ 'n', 'x', 'o' }, 'üd', function()
        require('nvim-treesitter-textobjects.move').goto_previous('@conditional.outer', 'textobjects')
        vim.cmd 'normal! zz'
      end, { desc = 'Tresitter: Prev Conditional' })
    end,
  },
}
