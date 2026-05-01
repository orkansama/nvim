return {
    "lewis6991/gitsigns.nvim",
    config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      watch_gitdir = {
        enable = true,
        follow_files = true
      },
      attach_to_untracked = true,
      sign_priority = 1,
      update_debounce = 100,
      status_formatter = nil, -- Use default
    }

    vim.keymap.set('n', '<leader>jn', function() gitsigns.nav_hunk('next') end)
    vim.keymap.set('n', '<leader>jp', function() gitsigns.nav_hunk('prev') end)
    end
}
