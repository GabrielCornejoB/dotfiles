-- adds a floating command bar instead of the one down below
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        'rcarriga/nvim-notify',
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                long_message_to_split = true, -- long messages will be sent to a split
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        })
        require("notify").setup({
            background_colour = "#000000",
        })
    end
}
