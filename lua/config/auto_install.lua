vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  callback = function()
    local masonIsLoaded = require('lazy.core.config').plugins['mason.nvim']._.loaded
    local treesitterIsLoaded = require('lazy.core.config').plugins['nvim-treesitter']._.loaded

    if treesitterIsLoaded then
      vim.cmd.TSInstall 'lua'
      vim.cmd.TSInstall 'c_sharp'
      vim.cmd.TSInstall 'gitcommit'
    end

    if masonIsLoaded then
      local masonAutoInstall = require 'mason-auto-install'
      masonAutoInstall.setup {
        packages = {
          {
            'roslyn-language-server',
            filetypes = {},
          },
          {
            'lua-language-server',
            dependencies = {
              'stylua',
            },
            filetypes = {},
          },
        },
      }
    end
  end,
})
