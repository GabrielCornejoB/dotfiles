-- renders markdown nicely: headings, code blocks, tables, checkboxes, callouts...
return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	ft = { 'markdown' }, -- only load when opening a markdown file
	opts = {
		-- since lazy loaded, restart the treesitter highlighter on first attach
		-- so highlights disabled by this plugin are applied correctly
		restart_highlighter = true,
		-- checkbox [x]/[ ] and callout [!NOTE] completions, served through
		-- the 'lsp' source already configured in blink.cmp
		completions = { lsp = { enabled = true } },
	},
}
