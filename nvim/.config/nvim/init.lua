-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

vim.opt.fillchars = { fold = ' ' }
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- '.' in path means: when searching for files (e.g. via 'gf'),
-- also look relative to the directory of the currently open file.
-- This allows navigating to relative paths like './other-file.md'.
vim.opt.path:append('.')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>wr', '<C-w>r', { desc = 'Rotate windows downwards/rightwards' })
vim.keymap.set('n', '<leader>wR', '<C-w>R', { desc = 'Rotate windows upwards/leftwards' })
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Quit the window' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>ww', 'gt', { desc = 'Switch tab forward' })
vim.keymap.set('n', '<leader>wW', 'gT', { desc = 'Switch tab backward' })
vim.keymap.set('n', '<leader>wT', '<C-w>T', { desc = 'Move the current window to a new tab page' })
vim.keymap.set('n', '<leader>wH', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<leader>wJ', '<C-w>J', { desc = 'Move window to the bottom' })
vim.keymap.set('n', '<leader>wK', '<C-w>K', { desc = 'Move window to the top' })
vim.keymap.set('n', '<leader>wL', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<leader>wu', '<C-w><', { desc = 'Decrease width' })
vim.keymap.set('n', '<leader>wi', '<C-w>>', { desc = 'Increase width' })
vim.keymap.set('n', '<leader>wo', '<C-w>-', { desc = 'Decrease height' })
vim.keymap.set('n', '<leader>wp', '<C-w>+', { desc = 'Increase height' })
vim.keymap.set('n', '<leader>wO', '<C-w>o', { desc = 'Close other windows' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize window sizes' })
vim.keymap.set('n', '<leader>wm', '<C-w>|', { desc = 'Maximize window width' })
vim.keymap.set('n', '<leader>wM', '<C-w>_', { desc = 'Maximize window height' })
vim.keymap.set('n', '<leader>wx', '<C-w>x', { desc = 'Exchange windows' })
vim.keymap.set('n', '<leader>wt', '<C-w>t', { desc = 'Go to top-left window' })
vim.keymap.set('n', '<leader>wb', '<C-w>b', { desc = 'Go to bottom-right window' })
vim.keymap.set('n', '<leader>wn', '<C-w>n', { desc = 'Create new window' })
pcall(vim.keymap.del, 'n', '<leader>e')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('dotfiles-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    local ok, wk = pcall(require, 'which-key')
    if not ok then
      return
    end

    wk.add {
      { '<leader>w', group = '[W]indow navigation' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>o', group = 'Obsidian' },
      { '<leader>a', group = 'AI' },
    }
  end,
})

-- vim: ts=2 sts=2 sw=2 et
