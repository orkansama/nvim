vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyDone',
  callback = function()
    vim.cmd.TSInstall 'lua'
    vim.cmd.TSInstall 'c_sharp'
    vim.cmd.TSInstall 'gitcommit'

    local masonAutoInstall = require 'mason-auto-install'
    masonAutoInstall.setup {
      packages = {
        {
          'roslyn-language-server',
          dependencies = {
            'csharpier',
          },
        },
        {
          'lua-language-server',
          dependencies = {
            'stylua',
          },
        },
      },
    }
  end,
})
