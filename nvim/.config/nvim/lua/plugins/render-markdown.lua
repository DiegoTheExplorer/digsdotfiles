return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  enabled = true,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = {
      lsp = {
        enabled = true,
      },
    },
    code = {
      width = 'block',
    },
  },
}
