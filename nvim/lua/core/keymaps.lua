-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable SPC default behavior
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- Default opts
local opts = { noremap = true, silent = true }

-- Delete content from cursor to first col with option+backspace (mac) or alt+backspace (win)
vim.keymap.set("i", "<M-BS>", "<C-u>", { noremap = true })

-- Make that 'x' key deletion doesn't copies to clipboard
vim.keymap.set('n', 'x', '"_x', opts)

-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Move cursor between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Rezise splits with arrow keys
vim.keymap.set('n', '<Up>', ':resize -2 <CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2 <CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2 <CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2 <CR>', opts)

-- Close current split window 
vim.keymap.set('n', '<leader>xs', ':close<CR>', { noremap = true, silent = true, desc = '[C]lose hovered [S]plit' } )

-- Toggle line wrap
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in visual mode whille identing
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

vim.keymap.set('n', 'K', function()
    require('pretty_hover').hover()
end, { desc = "Pretty Hover" })

-- Show full diagnostic message for the current line in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Shoe line Diagnostics float' })
