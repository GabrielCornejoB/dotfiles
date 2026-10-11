-- bottom bar with current file info 
return {
    'nvim-lualine/lualine.nvim',
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',

    config = function()
        local mode = {
            'mode',
            fmt = function(str)
                return ' ' .. str
            end
        }

        local filename = { 'filename', file_status = true, path = 0 }

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 100
        end

        local diff = {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            cond = hide_in_width,
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'neo-tree' },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { { 'branch', icon = '' } },
                lualine_c = { filename },
                lualine_x = { diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { { 'location', padding = 0 } },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
        }
    end,
}
