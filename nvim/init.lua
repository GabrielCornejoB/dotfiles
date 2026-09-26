require 'core.options'
require 'core.keymaps'
require 'custom.smart-comment-enter'

-- Lazy Plugin Manager Config
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Plugins installation & config
require('lazy').setup({
    require 'plugins.one-dark-theme',
    require 'plugins.oil',
    require 'plugins.treesitter',
    require 'plugins.lualine',
    require 'plugins.which-key',
    require 'plugins.telescope',
    require 'plugins.todo',
    require 'plugins.mason',
    require 'plugins.mason-lspconfig',
    require 'plugins.blink',
    require 'plugins.pretty-hover',
    require 'plugins.noice',
    require 'plugins.trouble',
    { 'neovim/nvim-lspconfig' },
    { 'mfussenegger/nvim-jdtls' },
    { 'github/copilot.vim' },
})

