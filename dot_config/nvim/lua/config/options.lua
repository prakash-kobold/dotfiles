vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.termguicolors = true
vim.o.confirm = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.g.have_nerd_font = true

-- Sync clipboard after UI loads to avoid startup delay
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- JupyterHub: $HOME files show up owned by another uid, so nvim refuses to
-- rewrite its ShaDa file there (E137). Work from a copy in /tmp, which has the
-- right owner, and copy it back to $HOME on exit so it survives pod restarts.
if vim.env.JUPYTERHUB_USER and vim.uv.os_uname().sysname == 'Linux' then
  local persistent = vim.fn.stdpath 'state' .. '/shada/main.shada'
  local working = '/tmp/nvim-' .. vim.uv.getuid() .. '.shada'
  if vim.uv.fs_stat(working) == nil and vim.uv.fs_stat(persistent) ~= nil then
    assert(vim.uv.fs_copyfile(persistent, working))
  end
  vim.o.shadafile = working
  vim.api.nvim_create_autocmd('VimLeave', {
    desc = 'Copy the /tmp ShaDa file back to $HOME',
    group = vim.api.nvim_create_augroup('jh-shada-copy-back', { clear = true }),
    callback = function()
      vim.fn.mkdir(vim.fs.dirname(persistent), 'p')
      assert(vim.uv.fs_copyfile(working, persistent))
    end,
  })
end
