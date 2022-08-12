local status, numb = pcall(require, "numb")
if not status then
	return
end

numb.setup({
	show_numbers = true, -- Enable 'number' for the window while peeking
	show_cursorline = true, -- Enable 'cursorline' for the window while peeking
})
