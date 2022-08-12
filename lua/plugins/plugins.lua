local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

local util = require("packer.util")
-- Have packer use a popup window
packer.init({
	compile_path = util.join_paths(fn.stdpath("data"), "plugin", "packer_compiled.lua"),
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Mangager
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- Keybinding
	use("folke/which-key.nvim")

	-- Lua Development
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("nvim-lua/popup.nvim")
	use("folke/lua-dev.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- Installer
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters
	use("onsails/lspkind.nvim") -- show icon for cmp
	use("j-hui/fidget.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	-- -- Extra
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")
	use("petertriho/cmp-git")
	use("ray-x/cmp-treesitter")
	use("lukas-reineke/cmp-rg")
	-- Snippet
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Syntax/Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("p00f/nvim-ts-rainbow")

	-- UI
	use("folke/tokyonight.nvim") -- Colorscheme
	use("nvim-lualine/lualine.nvim") -- Statusline
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }) -- bufferline
	use("goolord/alpha-nvim") -- Startup

	-- Fuzzy Finder/Telescope
	use("nvim-telescope/telescope.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")

	-- Utility
	use("windwp/nvim-autopairs")
	use("kylechui/nvim-surround") -- ysiw
	use("norcalli/nvim-colorizer.lua")
	use("numToStr/Comment.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use("moll/vim-bbye") -- smart q
	use("ghillb/cybu.nvim") -- cycle buffer
	use("tversteeg/registers.nvim") -- registers
	use("lukas-reineke/indent-blankline.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MattesGroeger/vim-bookmarks") -- bookmark
	use("nacro90/numb.nvim")
	use("danymat/neogen") -- annotations
	use("windwp/nvim-spectre") -- Renamer

	-- File Explorer
	use("kyazdani42/nvim-tree.lua")
	-- Quickfix
	-- use("kevinhwang91/nvim-bqf")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
