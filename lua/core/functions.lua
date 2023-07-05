local M = {}

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes.(w/q) ",
    }, function(input)
      if input == "w" then
        vim.cmd("w")
        vim.cmd("q")
      elseif input == "q" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

vim.cmd(
'cnoreabbrev <expr> s getcmdtype() .. getcmdline() ==# \':s\' ? [getchar(), \'\'][1] .. "%s///g<Left><Left>" : \'s\'')

return M
