return {
  -- add colorschemes
  { "AlexvZyl/nordic.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  { "sainnhe/everforest" },
  { "shaunsingh/nord.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
      --style = "moon",
    },
  },
}
