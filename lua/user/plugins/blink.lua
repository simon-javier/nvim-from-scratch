return {
	{ -- optional blink completion source for require statements and module annotations
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "cargo build --release",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			sources = {
				-- add lazydev to your completion providers
				default = { "laravel", "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
					laravel = {
						name = "laravel",
						module = "laravel.blink_source",
					},
				},
			},
			-- completion = {
			--
			-- }
		},
	},
}
