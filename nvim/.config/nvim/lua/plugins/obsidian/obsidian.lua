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
      mappings = {
        ['<leader>ox'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = 'Obsidian: Toggle checkbox' },
        },
      },
      disable_frontmatter = true,
    },
    keys = {
      { '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian: Quick switch' },
      { '<leader>on', '<cmd>ObsidianNew<CR>', desc = 'Obsidian: New note' },
      { '<leader>os', '<cmd>ObsidianDailies -10 0<CR>', desc = 'Obsidian: Daily notes (last 10 days)' },
      { '<leader>oS', '<cmd>ObsidianSearch<CR>', desc = 'Obsidian: Search content' },
      { '<leader>ot', '<cmd>ObsidianToday<CR>', desc = 'Obsidian: Today' },
      { '<leader>oy', '<cmd>ObsidianYesterday<CR>', desc = 'Obsidian: Yesterday' },
      { '<leader>om', '<cmd>ObsidianTomorrow<CR>', desc = 'Obsidian: Tomorrow' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<CR>', desc = 'Obsidian: Backlinks' },
      { '<leader>ol', '<cmd>ObsidianFollowLink<CR>', desc = 'Obsidian: Follow link' },
      { '<leader>oL', '<cmd>ObsidianLinks<CR>', desc = 'Obsidian: Links in current note' },
      { '<leader>or', '<cmd>ObsidianRename --dry-run<CR>', desc = 'Obsidian: Rename (dry run)' },
      { '<leader>oR', '<cmd>ObsidianRename<CR>', desc = 'Obsidian: Rename note' },
      { '<leader>oT', '<cmd>ObsidianTemplate<CR>', desc = 'Obsidian: Insert template' },
      { '<leader>oc', '<cmd>ObsidianToggleCheckbox<CR>', desc = 'Obsidian: Toggle checkbox' },
      { '<leader>oO', '<cmd>ObsidianOpen<CR>', desc = 'Obsidian: Open in app' },
      { '<leader>oW', '<cmd>ObsidianWorkspace<CR>', desc = 'Obsidian: Switch workspace' },
      { '<leader>o#', '<cmd>ObsidianTags<CR>', desc = 'Obsidian: Find tags' },
      { '<leader>oP', '<cmd>ObsidianPasteImg<CR>', desc = 'Obsidian: Paste image' },
      { '<leader>oa', '<cmd>ObsidianTOC<CR>', desc = 'Obsidian: Table of contents' },
    },
  },
}
