return {
  'owallb/mason-auto-install.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig',
  },

  -- Add new Mason-Utility:
  -- 1. Add to corresponding array
  -- 2. If Utility is LSP, add a config
  -- 3. Name of config has to be the same as from the LSP
  config = function()
    local serverArray = {
      -- LSP
      'lua-language-server',
      'roslyn',
    }

    local formaterArray = {
      'clang-format',
      'stylua',
      -- 'csharpier',
    }

    local dapArray = {
      'netcoredbg',
    }

    local combinedArray = {}
    vim.list_extend(combinedArray, serverArray)
    vim.list_extend(combinedArray, formaterArray)
    vim.list_extend(combinedArray, dapArray)

    local mason = require 'mason'
    local masonAutoInstall = require 'mason-auto-install'
    mason.setup {
      registries = {
        -- Custom registries for roslyn
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    }
    masonAutoInstall.setup { packages = combinedArray }

    -- Name of config has to be the same as from the LSP
    vim.env.DOTNET_CLI_UI_LANGUAGE = "en"
    vim.env.DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1"
    vim.lsp.config('roslyn', {})

    vim.lsp.config('lua-language-server', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
    })

    vim.lsp.enable(serverArray)
  end,
}
