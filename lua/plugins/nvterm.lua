-- [nfnl] Compiled from fnl/plugins/nvterm.fnl by https://github.com/Olical/nfnl, do not edit.
do end (require("nvterm")).setup({behavior = {auto_insert = true, autoclose_on_quit = {confirm = true, enabled = false}, close_on_exit = true}, terminals = {list = {}, shell = vim.o.shell, type_opts = {float = {border = "single", col = 0.25, height = 0.4, relative = "editor", row = 0.3, width = 0.5}, horizontal = {location = "rightbelow", split_ratio = 0.3}, vertical = {location = "rightbelow", split_ratio = 0.5}}}})
local terminal = require("nvterm.terminal")
local ft_cmds = {python = ("python3 " .. vim.fn.expand("%"))}
local toggle_modes = {"n", "t"}
local mappings
local function _1_()
  return terminal.send(ft_cmds[vim.bo.filetype])
end
local function _2_()
  return terminal.toggle("horizontal")
end
local function _3_()
  return terminal.toggle("vertical")
end
local function _4_()
  return terminal.toggle("float")
end
mappings = {{"n", "<C-l>", _1_}, {toggle_modes, "<A-h>", _2_}, {toggle_modes, "<A-v>", _3_}, {toggle_modes, "<A-i>", _4_}}
local opts = {noremap = true, silent = true}
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
return nil
