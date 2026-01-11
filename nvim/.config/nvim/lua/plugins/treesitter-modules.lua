return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ---@module 'treesitter-modules'
  ---@type ts.mod.UserConfig
  opts = {
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
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<Leader>ss',
        node_incremental = '<Leader>si',
        scope_incremental = '<Leader>sc',
        node_decremental = '<Leader>sd',
      },
    },

    textobjects = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
        ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
      },

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
}
