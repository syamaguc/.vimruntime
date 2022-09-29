local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

local callback = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup({
  ignore_ft_on_setup = {
    "alpha",
  },
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
  update_cwd = true,
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = callback("edit") },
        { key = "s", cb = callback("split") },
        { key = "v", cb = callback("vsplit") },
      },
    },
  },
})
