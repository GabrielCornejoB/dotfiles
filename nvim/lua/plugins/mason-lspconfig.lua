-- plugin for compatibility between mason & nvim-lspconfig 
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 'mason.nvim', 'nvim-lspconfig' },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
            },
            automatic_enable = {
                'lua_ls',
                'gopls',
                'tsc',
            }
        })

        local find_oxlint_root = vim.lsp.config.oxlint.root_dir
        vim.lsp.config('oxlint', {
            root_dir = function(bufnr, on_dir)
                find_oxlint_root(bufnr, function(root)
                    if root and vim.fn.executable(root .. '/node_modules/.bin/oxlint') == 1 then
                        on_dir(root)
                    end
                end)
            end,
        })
        vim.lsp.enable('oxlint')
    end,
}
