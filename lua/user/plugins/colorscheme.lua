return {
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyCursorColor = true
			vim.g.moonflyNormalFloat = true

			vim.o.winborder = "single"
			vim.cmd([[colorscheme moonfly]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
				background = {
					dark = "dragon",
				},
			})

			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")

			vim.api.nvim_set_hl(0, "Visual", { bg = "#504945" })
		end,
	},
}
