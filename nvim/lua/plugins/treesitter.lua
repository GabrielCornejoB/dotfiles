-- transforms text into a tree which enables text highlighting 
return {
    "nvim-treesitter/nvim-treesitter",
    commit = 'f8bbc3177d929dc86e272c41cc15219f0a7aa1ac',
    build = ':TSUpdate',
    config = function()
        local parsers = {
                "vim", "vimdoc", "lua",
                "java", "javadoc", "groovy", "properties",
                "javascript", "html", "css", "jsdoc",
                "typescript", "angular", "scss",
                "json", "yaml", "xml",
                "gitignore", "editorconfig",
                "markdown", "markdown_inline",
                "dockerfile",
                "bash", "regex"
        }
        require'nvim-treesitter'.install(parsers)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
