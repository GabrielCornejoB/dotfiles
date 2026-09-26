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
            }
        })
    end,
}
