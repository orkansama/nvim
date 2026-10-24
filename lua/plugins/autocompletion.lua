return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  opts = {
    keymap = { preset = 'enter' },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
      menu = {
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', gap = 1, 'kind' },
          },
          snippet_indicator = '~',
        },
        border = 'single',
        scrollbar = false,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      min_keyword_length = 3,
    },
    cmdline = {
      enabled = false,
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
