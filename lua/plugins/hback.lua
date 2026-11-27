return {
  'axkirillov/hbac.nvim',
  config = function()
    require('hbac').setup {
      autoclose = true,
      autopin = true,
      autopin_events = { 'InsertEnter' },
      threshold = 10,
      count_pinned = true,
      close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
      end,
      close_buffers_with_windows = false,
    }
  end,
}
