return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-modules').setup {

      ensure_installed = {
        'bash',
        'c',
        'diff',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'java',
        'regex',
        'sql',
        'html',
        'css',
        'javascript',
        'typescript',
        'svelte',
      },
      ignore_install = { 'latex' },
      auto_install = true,

      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Leader>ss',
          node_incremental = '<Leader>si',
          scope_incremental = '<Leader>sc',
          node_decremental = '<Leader>sd',
        },
      },
    }
  end,
}
