-- Alpha no statusline
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
	end,
})

-- Quickfixlist editable
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = {
		"quickfix",
	},
	callback = function()
		vim.cmd([[
      set modifiable
      set errorformat=%f\|%l\ col\ %c\|\ %m
      cnoremap <silent> <buffer> r :cbuffer<CR> 
    ]])
	end,
})

-- close window q & <ESC>
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"DressingSelect",
		"Markdown",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "" },
	callback = function()
		local buf_ft = vim.bo.filetype
		if buf_ft == "" or buf_ft == nil then
			vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <c-j> j<CR> 
      nnoremap <silent> <buffer> <c-k> k<CR> 
      set nobuflisted 
    ]])
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "" },
	callback = function()
		local get_project_dir = function()
			local cwd = vim.fn.getcwd()
			local project_dir = vim.split(cwd, "/")
			local project_name = project_dir[#project_dir]
			return project_name
		end

		vim.opt.titlestring = get_project_dir() .. " - nvim"
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "term://*" },
	callback = function()
		vim.cmd("startinsert!")
		vim.cmd("set cmdheight=1")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

-- disable auto commentout
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- highlight when yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return
		end
		if luasnip.expand_or_jumpable() then
			-- ask maintainer for option to make this silent
			-- luasnip.unlink_current()
			vim.cmd([[silent! lua require("luasnip").unlink_current()]])
		end
	end,
})
