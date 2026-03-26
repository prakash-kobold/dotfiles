-- Clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic config & keymaps
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = true,
  virtual_lines = false,
  jump = { float = true },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode more easily
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Make Y behave like D and C (yank to end of line)
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Use Q for formatting instead of Ex mode
vim.keymap.set('n', 'Q', 'gq', { desc = 'Format with Q' })

-- Break undo sequence before C-U in insert mode
vim.keymap.set('i', '<C-U>', '<C-G>u<C-U>', { desc = 'Break undo before C-U' })

-- Toggle spell check
vim.keymap.set('n', '<F9>', '<cmd>set invspell<CR>', { desc = 'Toggle spell check' })

-- Remove trailing whitespace
vim.keymap.set('n', ';tr', ':%s/\\s\\+$//<CR>', { desc = 'Remove trailing whitespace' })
vim.keymap.set('v', ';tr', ':s/\\s\\+$//<CR>', { desc = 'Remove trailing whitespace' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
