-- [nfnl] Compiled from fnl/options.fnl by https://github.com/Olical/nfnl, do not edit.
local core = require("nfnl.core")
local config = require("nfnl.config")
local default = config.default()
do
  local starter = require("mini.starter")
  starter.setup()
end
do
  local marks = require("marks")
  marks.setup()
end
do
  local lualine = require("lualine")
  lualine.setup()
end
do
  local which_key = require("which-key")
  which_key.setup()
end
do end (require("which-key")).register({["<leader>c"] = {_ = "which_key_ignore", name = "[C]ode"}, ["<leader>d"] = {_ = "which_key_ignore", name = "[D]ocument"}, ["<leader>g"] = {_ = "which_key_ignore", name = "[G]it"}, ["<leader>h"] = {_ = "which_key_ignore", name = "[H]arpoon"}, ["<leader>o"] = {_ = "which_key_ignore", name = "[O]rgmode"}, ["<leader>r"] = {_ = "which_key_ignore", name = "[R]ename"}, ["<leader>s"] = {_ = "which_key_ignore", name = "[S]earch"}, ["<leader>w"] = {_ = "which_key_ignore", name = "[W]orkspace"}, ["<leader>x"] = {_ = "which_key_ignore", name = "[T]rouble"}})
do
  local ibl = require("ibl")
  ibl.setup()
end
do
  local pqf = require("pqf")
  pqf.setup()
end
do
  local dressing = require("dressing")
  dressing.setup()
end
do
  local better_escape = require("better_escape")
  better_escape.setup()
end
do
  local cmp = require("cmp")
  cmp.setup({{sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}})}})
  cmp.setup.cmdline({"/", "?"}, {{mapping = cmp.mapping.preset.cmdline}, {sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})}})
end
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
  nmap("gr", (require("telescope.builtin")).lsp_references, "[G]oto [R]eferences")
  nmap("gI", (require("telescope.builtin")).lsp_implementations, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", (require("telescope.builtin")).lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", (require("telescope.builtin")).lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  local function _2_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  nmap("<leader>wl", _2_, "[W]orkspace [L]ist Folders")
  local function _3_(_0)
    return vim.lsp.buf.format()
  end
  return vim.api.nvim_buf_create_user_command(bufnr, "Format", _3_, {desc = "Format current buffer with LSP"})
end
do
  local lspconfig = require("lspconfig")
  local servers = {"lua_ls", "gopls", "fennel_language_server"}
  for index, value in ipairs(servers) do
    lspconfig[value].setup({capabilities = capabilities, on_attach = on_attach})
  end
end
pcall((require("telescope")).load_extension, "fzf")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.wo.number = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
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
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", {clear = true})
local function _4_()
  return vim.highlight.on_yank()
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _4_, group = highlight_group, pattern = "*"})
do end (require("telescope")).setup({defaults = {mappings = {i = {["<C-u>"] = false, ["<C-d>"] = false}}}})
vim.keymap.set("n", "<leader>?", (require("telescope.builtin")).oldfiles, {desc = "[?] Find recently opened files"})
vim.keymap.set("n", "<leader>b", (require("telescope.builtin")).buffers, {desc = "[ ] Find existing buffers"})
local function _5_()
  return (require("telescope.builtin")).current_buffer_fuzzy_find((require("telescope.themes")).get_dropdown({winblend = 10, previewer = false}))
end
vim.keymap.set("n", "<leader>/", _5_, {desc = "[/] Fuzzily search in current buffer"})
vim.keymap.set("n", "<leader>gf", (require("telescope.builtin")).git_files, {desc = "Search [G]it [F]iles"})
vim.keymap.set("n", "<leader>sf", (require("telescope.builtin")).find_files, {desc = "[S]earch [F]iles"})
vim.keymap.set("n", "<leader>sh", (require("telescope.builtin")).help_tags, {desc = "[S]earch [H]elp"})
vim.keymap.set("n", "<leader>sw", (require("telescope.builtin")).grep_string, {desc = "[S]earch current [W]ord"})
vim.keymap.set("n", "<leader>sg", (require("telescope.builtin")).live_grep, {desc = "[S]earch by [G]rep"})
vim.keymap.set("n", "<leader>sd", (require("telescope.builtin")).diagnostics, {desc = "[S]earch [D]iagnostics"})
return (require("nvim-treesitter.configs")).setup({ensure_installed = {"c", "cpp", "go", "lua", "python", "rust", "tsx", "typescript", "vimdoc", "vim", "scala", "elixir", "heex", "kotlin", "fennel"}, highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<c-space>", node_decremental = "<M-space>", node_incremental = "<c-space>", scope_incremental = "<c-s>"}}, indent = {enable = true}, textobjects = {move = {enable = true, goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"}, goto_next_start = {["]]"] = "@class.outer", ["]m"] = "@function.outer"}, goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}, goto_previous_start = {["[["] = "@class.outer", ["[m"] = "@function.outer"}, set_jumps = true}, select = {enable = true, keymaps = {aa = "@parameter.outer", ac = "@class.outer", af = "@function.outer", ia = "@parameter.inner", ic = "@class.inner", ["if"] = "@function.inner"}, lookahead = true}, swap = {enable = true, swap_next = {["<leader>a"] = "@parameter.inner"}, swap_previous = {["<leader>A"] = "@parameter.inner"}}}, auto_install = false})
