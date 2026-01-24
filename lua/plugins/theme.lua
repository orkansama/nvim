return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
	opts = {
		flavour = "mocha",
	},
    config = function()
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
