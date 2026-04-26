return {
    "lewis6991/gitsigns.nvim",
    config = function()
    require('gitsigns').setup {
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
    end
}
