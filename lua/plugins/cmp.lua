-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local cmp = require("cmp")
local luasnip = require("luasnip")
do end (require("luasnip.loaders.from_vscode")).lazy_load()
luasnip.config.setup({})
local function has_words_before()
  if (vim.api.nvim_buf_get_option(0, "buftype") == "prompt") then
    return false
  else
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (((vim.api.nvim_buf_get_text(0, (line - 1), 0, (line - 1), col, {}))[1]):match("^%s*$") == nil))
end
local lspkind = require("lspkind")
local function _2_(entry, vim_item)
  return vim_item
end
local function _3_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif (require("luasnip")).jumpable(( - 1)) then
    return vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
  else
    return fallback()
  end
end
local function _5_(fallback)
  if (cmp.visible() and has_words_before()) then
    return cmp.select_next_item()
  elseif (require("luasnip")).expand_or_jumpable() then
    return vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
  else
    return fallback()
  end
end
local function _7_(args)
  return (require("luasnip")).lsp_expand(args.body)
end
cmp.setup({formatting = {format = lspkind.cmp_format({before = _2_, ellipsis_char = "...", maxwidth = 50, mode = "symbol", symbol_map = {Copilot = "\239\132\147"}})}, mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping.complete(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-e>"] = cmp.mapping.abort(), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<S-Tab>"] = cmp.mapping(_3_, {"i", "s"}), ["<Tab>"] = cmp.mapping(_5_, {"i", "s"})}), snippet = {expand = _7_}, sources = cmp.config.sources({{group_index = 2, name = "copilot"}, {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}, {name = "conjure"}})})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
