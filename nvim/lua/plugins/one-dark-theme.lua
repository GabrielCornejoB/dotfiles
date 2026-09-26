-- color theme 
return {
    "navarasu/onedark.nvim",
    commit = '213c23ae45a04797572242568d5d51937181792d',
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
        require('onedark').setup {
            style = 'cool',
            transparent = true,
            code_style = {
                comments = 'italic',
                keywords = 'bold',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            }
        }
        require('onedark').load()
    end
}
