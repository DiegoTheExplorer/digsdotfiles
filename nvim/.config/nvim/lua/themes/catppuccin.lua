return {
  { -- You can easily change to a different colorscheme.
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
    end,
  },
}
