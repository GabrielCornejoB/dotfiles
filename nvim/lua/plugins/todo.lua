-- highlights to-do comments, and with telescope helps find all to-dos 
return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    opts = {
        signs = true,
        keywords = {
            TODO = { icon = ' ', color = 'info' },
        },
    },
    lazy = false,
    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
        { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
}
