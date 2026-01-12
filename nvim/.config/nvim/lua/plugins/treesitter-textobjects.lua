return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  config = function()
    require('nvim-treesitter-textobjects').setup {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    }

    local select = require('nvim-treesitter-textobjects.select').select_textobject

    vim.keymap.set({ 'x', 'o' }, 'af', function()
      select('@function.outer', 'textobjects')
    end, { desc = 'Select around function' })
    vim.keymap.set({ 'x', 'o' }, 'if', function()
      select('@function.inner', 'textobjects')
    end, { desc = 'Select inside function' })
    vim.keymap.set({ 'x', 'o' }, 'ac', function()
      select('@class.outer', 'textobjects')
    end, { desc = 'Select around class' })
    vim.keymap.set({ 'x', 'o' }, 'ic', function()
      select('@class.inner', 'textobjects')
    end, { desc = 'Select inside class' })
    vim.keymap.set({ 'x', 'o' }, 'as', function()
      select('@local.scope', 'locals')
    end, { desc = 'Select around local scope' })
  end,
}
