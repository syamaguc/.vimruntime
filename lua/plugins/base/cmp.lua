local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local status, luasnip = pcall(require, "luasnip")
if not status then
  return
end

local status, lspkind = pcall(require, "lspkind")
if not status then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        local source_mapping = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          cmp_tabnine = "[TN]",
          copilot = "[Copilot]",
          luasnip = "[Snippet]",
          path = "[Path]",
        }
        vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol_text" })
        vim_item.menu = source_mapping[entry.source.name]
        if entry.source.name == "copilot" then
          vim_item.kind = ""
        end
        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.data or {}).detail
          vim_item.kind = ""
          if detail and detail:find(".*%%.*") then
            vim_item.kind = vim_item.kind .. " " .. detail
          end

          if (entry.completion_item.data or {}).multiline then
            vim_item.kind = vim_item.kind .. " " .. "[ML]"
          end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmp_tabnine" },
    { name = "emoji" },
    -- { name = "treesitter" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "buffer" },
    { name = "nvim_lsp_document_symbol" },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  }),
})
