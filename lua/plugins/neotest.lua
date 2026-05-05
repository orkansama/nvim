return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "Issafalcon/neotest-dotnet"
  },
  -- Dont forget Treesitter!
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet")
      }})
  end
}
