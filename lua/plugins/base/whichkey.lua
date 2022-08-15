local status, which_key = pcall(require, "which-key")
if not status then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	},
}

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
	a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
	m = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
	j = { "<cmd>silent BookmarkNext<cr>", "Next" },
	k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
	s = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
	x = { "<cmd>silent BookmarkClear<cr>", "Clear" },
	X = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
}

local v_opts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local v_mappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	w = { "<cmd>w<CR>", "Write" },
	e = { "<cmd>NvimTreeToggle<CR>", "nvim-tree" },
	["<CR>"] = { "<cmd>nohlsearch<CR>", "No HL" },
	["<ESC>"] = { '<cmd>lua require("core.functions").smart_quit()<CR>', "Quit" },
	["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },

	f = {
		name = "Find",
		g = { "<cmd>Telescope git_files<cr>", "Git files" },
		f = { "<cmd>Telescope find_files<cr>", "Find files" },
		t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
		s = { "<cmd>Telescope grep_string<cr>", "Find String" },
		m = { "<cmd>Telescope vim_bookmarks all<cr>", "Bookmarks" },
		o = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		C = { "<cmd>Cheatsheet<cr>", "Cheatsheet" },
	},

	r = {
		name = "Replace",
		r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
	},

	g = {
		name = "LSP",
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Reference" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename vars" },
	},
	l = {
		name = "LSP",
		l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle lsp_lines" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
			"Prev Diagnostic",
		},
		-- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		-- i = { "<cmd>LspInfo<cr>", "Info" },
		-- c = { "<cmd>lua require('plugins.lsp').server_capabilities()<cr>", "Get Capabilities" },
		-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	},

	t = {
		name = "TODO",
		t = { "<cmd>TodoQuickfix<cr>", "Quickfix" },
		l = { "<cmd>TodoLoclist<cr>", "Loclist" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(m_mappings, m_opts)
which_key.register(v_mappings, v_opts)
