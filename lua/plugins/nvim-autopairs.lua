if vim.g.vscode then
  return {
    -- disable
    -- Is default in vscode
  }
else
  return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  }
end
