local status, rt = pcall(require, "rust-tools")
if not status then
	return
end

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
		end,
	},
})
