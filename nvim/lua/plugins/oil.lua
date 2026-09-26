-- file explorer 
return {
    'stevearc/oil.nvim',
    commit = 'f55b25e493a7df76371cfadd0ded5004cb9cd48a',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('oil').setup({
            view_options = {
                show_hidden = false,
            },
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ['<CR>'] = { 'actions.select' },
                ['<C-p>'] = { 'actions.preview', opts = { split = 'belowright' } },
                ['<leader>ov'] = { 'actions.select', opts = { vertical = true }, desc = '[o]pen on [v]ertical split' },
                ['<leader>oh'] = { 'actions.select', opts = { horizontal = true }, desc = '[o]pen on [h]orizontal split' },
                ['-'] = { 'actions.parent', mode = 'n' },
                ['_'] = { 'actions.open_cwd', mode = 'n' },
                ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
                ["<C-c>"] = { "actions.close", mode = "n" },
                ['<leader><CR>'] = {
                    desc = 'Recursively open directories',
                    callback = function()
                        local oil = require('oil')
                        local dir = oil.get_current_dir()
                        local cursor = oil.get_cursor_entry()

                        local function o()
                            oil.open(dir .. cursor.name)
                            vim.wait(50)

                            dir = oil.get_current_dir()
                            oil.get_cursor_entry()

                            local bn = vim.fn.bufnr()
                            local lines = vim.api.nvim_buf_line_count(bn)
                            if lines == 1 and cursor ~= nil and cursor.type == 'directory' then
                                o()
                            end
                        end

                        o()
                    end,
                },
            },
            use_default_keymaps = false,
        })
        vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end
}
