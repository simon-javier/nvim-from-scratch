local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Groups defined once at the top
local yank_group = augroup("YankGroup", { clear = true })
local comment_group = augroup("CommentGroup", { clear = true })
local file_group = augroup("FileGroup", { clear = true })

autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.hl.on_yank()
	end,
})

autocmd("BufEnter", {
	group = comment_group,
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

autocmd("FileType", {
	group = file_group,
	callback = function()
		local exclude = { "oil", "qf", "netrw", "lazy", "mason_backdrop", "blink-cmp-menu", "fidget", "snacks" }
		if vim.tbl_contains(exclude, vim.bo.filetype) then
			return
		end

		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if not lang then
			return
		end

		local ok, _ = pcall(vim.treesitter.start)
		if ok then
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo[0][0].foldmethod = "expr"

			-- Only set indent if nvim-treesitter is actually loaded
			local has_ts, _ = pcall(require, "nvim-treesitter")
			if has_ts then
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end
	end,
})

autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})

autocmd("LspAttach", {
	group = augroup("kickstart-lsp-attach", { clear = false }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if not client then
			return
		end -- Safety check

		local function client_supports_method(cl, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return cl:supports_method(method, bufnr)
			else
				return cl.supports_method(method, { bufnr = bufnr })
			end
		end

		-- Document Highlight Logic
		if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = augroup("kickstart-lsp-highlight", { clear = false })
			autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			autocmd("LspDetach", {
				group = augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
