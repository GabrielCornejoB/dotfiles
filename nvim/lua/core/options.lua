-- line numbers
vim.wo.number = true -- enable numbers on the left
vim.o.relativenumber = true -- make numbers on the left change relatively from cursor position
vim.o.numberwidth = 3 -- make 3 chars the width of the left bar
vim.o.signcolumn = 'yes'

-- word wrap
vim.o.wrap = false -- disable word wrap by default
vim.o.linebreak = true

-- search
vim.o.ignorecase = true -- by default search while ignoring if the text is MAYUS or MINUS
vim.o.hlsearch = true -- highlight search encounters by default
vim.o.smartcase = true -- if the pattern contains a character in MAYUS, then it searchs by not ignoring the case

-- clipboard
vim.o.clipboard = vim.fn.has("mac") == 1 and "unnamedplus" or "" -- on windows the clipboard most be used with "+ and then y or p

-- tabs / indentations
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.showtabline = 1
vim.o.autoindent = true
vim.o.backspace = 'indent,eol,start'

-- netrw file explorer (disable by default)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- scroll
vim.o.scrolloff = 8 -- makes it so when scrolling, there are always 8 visible lines

-- general
vim.o.fileencoding = 'utf-8'
vim.o.showmode = false -- disable default show mode, bc lualine plugin already shows it
vim.opt.termguicolors = true
vim.opt.backup = false -- disable backup file explorer
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits right of current window
vim.opt.cursorline = true

-- diagnostics
vim.diagnostic.config({
    virtual_text = { spacing = 4, source = 'if_many', prefix = ' ' }, -- inline warnings
    virtual_lines = false, -- newline warnings
    float = { border = 'rounded', source = 'always', wrap = true, max_width = 90 }, -- full message wrapped in a float
})

