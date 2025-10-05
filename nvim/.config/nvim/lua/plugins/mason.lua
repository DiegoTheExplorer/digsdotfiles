return {
  'williamboman/mason.nvim',
  lazy = false, -- Load immediately to ensure PATH is set
  cmd = 'Mason',
  keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
  build = ':MasonUpdate',
  opts = {},
}
