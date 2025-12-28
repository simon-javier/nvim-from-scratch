return {
	{
		"nvim-mini/mini.pairs",
		version = "*",
		opts = {},
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		opts = {
			mappings = {
				add = "SA", -- Add surrounding in Normal and Visual modes
				delete = "SD", -- Delete surrounding
				find = "SF", -- Find surrounding (to the right)
				-- find_left = "SF", -- Find surrounding (to the left)
				highlight = "SH", -- Highlight surrounding
				replace = "SR", -- Replace surrounding
			},
		},
	},
}
