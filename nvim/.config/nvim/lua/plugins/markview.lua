return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- For `nvim-treesitter` users.
  priority = 49,
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    vim.cmd 'highlight MarkviewHeading guibg=NONE ctermbg=NONE'
    vim.cmd 'highlight MarkviewPalette0Bg guibg=NONE ctermbg=NONE'
    vim.cmd 'highlight MarkviewCodeBlock guibg=NONE ctermbg=NONE'
  end,
}
