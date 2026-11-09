return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
        notify_no_formatters = false,
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },
        },
        formatters = {
            prettier = { require_cwd = true },
        },
        format_on_save = {
            timeout_ms = 2000,
            lsp_format = "never",
        },
    },
}
