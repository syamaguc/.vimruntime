local status, mason = pcall(require, "mason")
if not status then
	return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	return
end

local servers = {
	"jsonls",
	"yamlls",
  --"sumneko_lua",
  "lua_ls",
	"tsserver",
	"pyright",
	"bashls",
	--"clangd",
	"rust_analyzer",
}

mason.setup()
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local s = {}
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
	if lsp == "sumneko_lua" then
		s = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		}
	end

	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
		settings = s,
	})
end
