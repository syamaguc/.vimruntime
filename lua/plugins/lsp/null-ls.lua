local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.isort,
		formatting.stylua,
		formatting.jq,
		formatting.gofmt,
		formatting.markdownlint,
		formatting.clang_format,
		diagnostics.flake8,
		diagnostics.markdownlint,
		-- diagnostics.luacheck,
		-- diagnostics.eslint,
		diagnostics.shellcheck,
	},
})
