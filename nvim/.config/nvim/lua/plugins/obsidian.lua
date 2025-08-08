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
      workdays_only = false,
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
  vim.keymap.set('n', '<leader>om', '<cmd>Obsidian<cr>', { desc = 'Open obsidian.nvim menu' }),

  -- Creating new notes
  vim.keymap.set('n', '<leader>onn', '<cmd>Obsidian new<cr>', { desc = 'Create new blank obsidian note' }),
  vim.keymap.set('n', '<leader>ont', '<cmd>Obsidian new_from_template<cr>', { desc = 'Create new obsidian note from template' }),
  vim.keymap.set('n', '<leader>oit', '<cmd>Obsidian template<cr>', { desc = 'Choose template to insert into current note' }),

  -- Daily notes/journal shortcuts
  vim.keymap.set('n', '<leader>otd', '<cmd>Obsidian today<cr>', { desc = 'Open or create the @today daily journal/note' }),
  vim.keymap.set('n', '<leader>oyd', '<cmd>Obsidian yesterday<cr>', { desc = 'Open or create the @yesterday daily journal/note' }),
  vim.keymap.set('n', '<leader>otm', '<cmd>Obsidian tomorrow<cr>', { desc = 'Open or create the @tomorrow daily journal/note' }),

  -- Searching through the notes
  vim.keymap.set('n', '<leader>osn', '<cmd>Obsidian search<cr>', { desc = 'Grep through all notes in the vault' }),
  vim.keymap.set('n', '<leader>ost', '<cmd>Obsidian tags<cr>', { desc = 'Pick a tag and search through notes with the chosen tag' }),
  vim.keymap.set('n', '<leader>otc', '<cmd>Obsidian toc<cr>', { desc = 'Load the table of contents for the current not into a picker list' }),
}
