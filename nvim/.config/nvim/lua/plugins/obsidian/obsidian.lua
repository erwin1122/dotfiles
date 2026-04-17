return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = false,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      ui = {
        --enable = false,
        update_debounce = 200,
        max_file_length = 5000,
      },
      workspaces = {
        {
          name = 'Denkarium',
          path = '/mnt/c/Users/e.naibauer/OneDrive/Denkarium/',
        },
      },
      notes_subdir = '00_inbox',
      new_notes_location = 'notes_subdir',
      daily_notes = {
        folder = '01_daily/2026',
        date_format = '%d_%m_%Y',
        default_tags = {},
        template = 'daily_template',
      },
      templates = {
        folder = 'templates',
        date_format = '%d_%m_%Y',
        time_format = '%H:%M',
      },
      attachments = {
        img_folder = 'assets',
      },
      picker = {
        name = 'telescope.nvim',
      },
      sort_by = 'modified',
      sort_reversed = true,
      open_notes_in = 'current',
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      disable_frontmatter = true,
    },
    keys = {
      { '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian: Quick switch' },
      { '<leader>on', '<cmd>ObsidianNew<CR>', desc = 'Obsidian: New note' },
      { '<leader>os', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian: Search notes' },
      { '<leader>oS', '<cmd>ObsidianSearch<CR>', desc = 'Obsidian: Search content' },
      { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = 'Obsidian: Today' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<CR>', desc = 'Obsidian: Backlinks' },
      { '<leader>ol', '<cmd>ObsidianFollowLink<CR>', desc = 'Obsidian: Follow link' },
    },
  },
}
