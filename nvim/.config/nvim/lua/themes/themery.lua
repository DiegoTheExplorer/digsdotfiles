return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      themes = {
        {
          name = 'Kanagawa Lotus',
          colorscheme = 'kanagawa-lotus',
        },
        {
          name = 'Kanagawa Wave',
          colorscheme = 'kanagawa-wave',
        },
        {
          name = 'Catppuccin Latte',
          colorscheme = 'catppuccin-latte',
        },
        {
          name = 'Catppuccin Mocha',
          colorscheme = 'catppuccin-mocha',
        },
      },
      vim.keymap.set('n', '<leader>tt', function()
        local themery = require 'themery'
        local currentTheme = themery.getCurrentTheme()
        if currentTheme and currentTheme.name == 'Catppuccin Latte' then
          themery.setThemeByName('Catppuccin Mocha', true)
        else
          themery.setThemeByName('Catppuccin Latte', true)
        end
      end, { noremap = true }),
    }
  end,
}
