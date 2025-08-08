return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    disable_frontmatter = true,
    note_id_func = function(title)
      local id_from_date_time = os.date('%Y%m%d%H%M%S', os.time())
      if title == nil then
        return id_from_date_time
      end

      local name = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      return id_from_date_time .. '-' .. name
    end,
    workspaces = {
      {
        name = 'diego',
        path = '~/Vaults/diego',
      },
    },
    templates = {
      folder = 'digs_obsidian_templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
    },
    daily_notes = {
      folder = 'daily_journal',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      default_tags = { 'daily-journal' },
      template = 'journal-entry.md',
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    picker = {
      name = 'snacks.pick',
    },
  },

  -- Command keymaps
  vim.keymap.set('n', '<leader>o', '<cmd>Obsidian<cr>', { desc = 'Open obsidian.nvim menu' }),
  vim.keymap.set('n', '<leader>onn', '<cmd>Obsidian new<cr>', { desc = 'Create new blank obsidian note' }),
  vim.keymap.set('n', '<leader>ont', '<cmd>Obsidian new_from_template<cr>', { desc = 'Create new obsidian note from template' }),
  vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian today<cr>', { desc = 'Open or create the daily journal/note' }),
}
