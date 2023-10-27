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
vim.g.mapleader = " "
vim.g.maplocalleader = ","
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
return nil
