-- [nfnl] Compiled from fnl/options.fnl by https://github.com/Olical/nfnl, do not edit.
local core = require("nfnl.core")
local config = require("nfnl.config")
local default = config.default()
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 200
vim.o.timeoutlen = 250
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.o.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = (os.getenv("HOME") .. "/.vim/undodir")
vim.opt.undofile = true
local minis = {"starter", "files", "misc", "move", "sessions", "ai", "pick", "extra", "statusline", "indentscope", "comment", "jump", "jump2d", "surround", "bracketed", "bufremove", "splitjoin"}
for _, value in ipairs(minis) do
  local mod_name = ("mini." .. value)
  local module = require(mod_name)
  module.setup()
end
vim.g.mapleader = " "
vim.g.maplocalleader = ","
local miniclue = require("mini.clue")
miniclue.setup({window = {config = {anchor = "SE", row = "auto", col = "auto"}}, clues = {miniclue.gen_clues.builtin_completion(), miniclue.gen_clues.g(), miniclue.gen_clues.marks(), miniclue.gen_clues.registers(), miniclue.gen_clues.windows(), miniclue.gen_clues.z(), {mode = "n", keys = "<LocalLeader>e", desc = "+EvalConjure"}, {mode = "n", keys = "<LocalLeader>l", desc = "+LogConjure"}, {mode = "n", keys = "<LocalLeader>r", desc = "+REPLConjure"}, {mode = "n", keys = "<LocalLeader>t", desc = "+TestConjure"}, {mode = "n", keys = "<LocalLeader>b", desc = "+Buffer"}, {mode = "n", keys = "<Leader>c", desc = "+Code"}, {mode = "n", keys = "<Leader>r", desc = "+Refactor"}, {mode = "n", keys = "<Leader>w", desc = "+Workspace"}, {mode = "n", keys = "<Leader>f", desc = "+Find"}, {mode = "n", keys = "<Leader>g", desc = "+Git"}, {mode = "n", keys = "<Leader>d", desc = "+Document"}}, triggers = {{keys = "<Leader>", mode = "n"}, {keys = "<Leader>", mode = "x"}, {keys = "<LocalLeader>", mode = "n"}, {keys = "<LocalLeader>", mode = "x"}, {keys = "<C-x>", mode = "i"}, {keys = "]", mode = "n"}, {keys = "]", mode = "x"}, {keys = "[", mode = "n"}, {keys = "[", mode = "x"}, {keys = "g", mode = "n"}, {keys = "g", mode = "x"}, {keys = "'", mode = "n"}, {keys = "`", mode = "n"}, {keys = "'", mode = "x"}, {keys = "`", mode = "x"}, {keys = "\"", mode = "n"}, {keys = "\"", mode = "x"}, {keys = "<C-r>", mode = "i"}, {keys = "<C-r>", mode = "c"}, {keys = "<C-w>", mode = "n"}, {keys = "z", mode = "n"}, {keys = "z", mode = "x"}}})
local function _1_()
  return MiniBufremove.delete()
end
vim.keymap.set("n", "<LocalLeader>bd", _1_, {desc = "Delete"})
vim.keymap.set("n", "<LocalLeader>bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", {desc = "Wipeout"})
do
  local marks = require("marks")
  marks.setup()
end
do
  local pqf = require("pqf")
  pqf.setup()
end
do
  local better_escape = require("better_escape")
  better_escape.setup()
end
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
local function _3_(entry, vim_item)
  return vim_item
end
local function _4_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif (require("luasnip")).jumpable(( - 1)) then
    return vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
  else
    return fallback()
  end
end
local function _6_(fallback)
  if (cmp.visible() and has_words_before()) then
    return cmp.select_next_item()
  elseif (require("luasnip")).expand_or_jumpable() then
    return vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
  else
    return fallback()
  end
end
local function _8_(args)
  return (require("luasnip")).lsp_expand(args.body)
end
cmp.setup({formatting = {format = lspkind.cmp_format({before = _3_, ellipsis_char = "...", maxwidth = 50, mode = "symbol", symbol_map = {Copilot = "\239\132\147"}})}, mapping = cmp.mapping.preset.insert({["<C-Space>"] = cmp.mapping.complete(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-e>"] = cmp.mapping.abort(), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-p>"] = cmp.mapping.select_prev_item(), ["<CR>"] = cmp.mapping.confirm({select = true}), ["<S-Tab>"] = cmp.mapping(_4_, {"i", "s"}), ["<Tab>"] = cmp.mapping(_6_, {"i", "s"})}), snippet = {expand = _8_}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}, {name = "copilot", group_index = 2}, {name = "conjure"}})})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})})
local capability = vim.lsp.protocol.make_client_capabilities()
local capabilities = (require("cmp_nvim_lsp")).default_capabilities(capability)
local function on_attach(_, bufnr)
  local function nmap(keys, func, desc)
    if desc then
      desc = ("LSP: " .. desc)
    else
    end
    return vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
  end
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", "<cmd>Pick lsp scope='references'", "[G]oto [R]eferences")
  nmap("gI", "<cmd>Pick lsp scope='implementation'", "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", "<cmd>Pick lsp scope='document_symbols'", "[D]ocument [S]ymbols")
  nmap("<leader>ws", "<cmd>Pick lsp scope='workspace_symbols'", "[W]orkspace [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  local function _10_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  nmap("<leader>wl", _10_, "[W]orkspace [L]ist Folders")
  local function _11_(_0)
    return vim.lsp.buf.format()
  end
  return vim.api.nvim_buf_create_user_command(bufnr, "Format", _11_, {desc = "Format current buffer with LSP"})
end
do end (require("neodev")).setup()
do
  local lspconfig = require("lspconfig")
  do
    local servers = {"lua_ls", "gopls", "fennel_language_server", "clangd"}
    for index, value in ipairs(servers) do
      lspconfig[value].setup({capabilities = capabilities, on_attach = on_attach})
    end
  end
  lspconfig.racket_langserver.setup({capabilities = capabilities, on_attach = on_attach})
end
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", {silent = true})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {clear = true})
local function _12_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _12_, group = highlight_group, pattern = "*"})
vim.keymap.set("n", "<leader>?", "<CMD>Pick oldfiles<CR>", {desc = "[?] Find recently opened files"})
vim.keymap.set("n", "<leader>b", "<CMD>Pick buffers<CR>", {desc = "[b] Find existing buffers"})
vim.keymap.set("n", "<leader>/", "<CMD>Pick buf_lines<CR>", {desc = "[/] Fuzzily search in current buffer"})
vim.keymap.set("n", "<leader>gf", "<CMD>Pick git_files<CR>", {desc = "Search [G]it [F]iles"})
vim.keymap.set("n", "<leader>ff", "<CMD>Pick files<CR>", {desc = "[F]ind [F]iles"})
vim.keymap.set("n", "<leader>fh", "<CMD>Pick help<CR>", {desc = "[S]earch [H]elp"})
vim.keymap.set("n", "<leader>fg", "<CMD>Pick grep_live<CR>", {desc = "[S]earch by [G]rep"})
vim.keymap.set("n", "<leader>fd", "<CMD>Pick diagnostic<CR>", {desc = "[S]earch [D]iagnostics"})
local function _13_()
  return MiniFiles.open()
end
vim.keymap.set("n", "<leader>e", _13_, {desc = "File [e]xplorer"})
do end (require("nvim-treesitter.configs")).setup({ensure_installed = {"c", "cpp", "go", "lua", "python", "rust", "tsx", "typescript", "vimdoc", "vim", "scala", "elixir", "heex", "kotlin", "fennel", "racket", "awk"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<c-space>", node_decremental = "<M-space>", node_incremental = "<c-space>", scope_incremental = "<c-s>"}}, indent = {enable = true}, textobjects = {move = {enable = true, goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"}, goto_next_start = {["]]"] = "@class.outer", ["]m"] = "@function.outer"}, goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}, goto_previous_start = {["[["] = "@class.outer", ["[m"] = "@function.outer"}, set_jumps = true}, select = {enable = true, keymaps = {aa = "@parameter.outer", ac = "@class.outer", af = "@function.outer", ia = "@parameter.inner", ic = "@class.inner", ["if"] = "@function.inner"}, lookahead = true}, swap = {enable = true, swap_next = {["<leader>a"] = "@parameter.inner"}, swap_previous = {["<leader>A"] = "@parameter.inner"}}}, auto_install = false})
do end (require("nvterm")).setup({behavior = {auto_insert = true, autoclose_on_quit = {confirm = true, enabled = false}, close_on_exit = true}, terminals = {list = {}, shell = vim.o.shell, type_opts = {float = {border = "single", col = 0.25, height = 0.4, relative = "editor", row = 0.3, width = 0.5}, horizontal = {location = "rightbelow", split_ratio = 0.3}, vertical = {location = "rightbelow", split_ratio = 0.5}}}})
local terminal = require("nvterm.terminal")
local ft_cmds = {python = ("python3 " .. vim.fn.expand("%"))}
local toggle_modes = {"n", "t"}
local mappings
local function _14_()
  return terminal.send(ft_cmds[vim.bo.filetype])
end
local function _15_()
  return terminal.toggle("horizontal")
end
local function _16_()
  return terminal.toggle("vertical")
end
local function _17_()
  return terminal.toggle("float")
end
mappings = {{"n", "<C-l>", _14_}, {toggle_modes, "<A-h>", _15_}, {toggle_modes, "<A-v>", _16_}, {toggle_modes, "<A-i>", _17_}}
local opts = {noremap = true, silent = true}
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to previous diagnostic message"})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to next diagnostic message"})
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, {desc = "Open floating diagnostic message"})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Open diagnostics list"})
local function _18_()
  return MiniMisc.zoom()
end
vim.keymap.set("n", "<leader>z", _18_, {desc = "Toggle Zoom current window"})
local rt = require("rust-tools")
rt.setup({server = {capabilities = capabilities, on_attach = on_attach}})
do end (require("copilot")).setup({copilot_node_command = "node", filetypes = {c = true, go = true, lua = true, python = true, rust = true, scala = true, help = false, cvs = false, yaml = false, ["."] = false, svn = false, gitcommit = false, gitrebase = false, markdown = false, hgcommit = false}, panel = {auto_refresh = true, keymap = {accept = "<CR>", jump_next = "]]", jump_prev = "[[", open = "<M-CR>", refresh = "gr"}, layout = {position = "bottom", ratio = 0.4}, enabled = false}, server_opts_overrides = {}, suggestion = {debounce = 75, keymap = {accept = "<Tab>", dismiss = "<C-q>", next = "<C-l>", prev = "<C-h>", accept_word = false, accept_line = false}, enabled = false, auto_trigger = false}})
vim.cmd("inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')")
vim.cmd("if executable('ag')\n  let g:ackprg = 'ag --vimgrep'\nendif")
vim.cmd("command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)")
vim.cmd("let g:fzf_vim = {}")
return vim.cmd("let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']")
