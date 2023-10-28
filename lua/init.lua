-- [nfnl] Compiled from fnl/init.fnl by https://github.com/Olical/nfnl, do not edit.
local lazy = require("lazy")
local function _1_()
  do end (require("telescope")).setup({extensions = {undo = {layout_config = {preview_height = 0.8}, layout_strategy = "vertical", side_by_side = true}}})
  do end (require("telescope")).load_extension("undo")
  return vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
end
local function _2_()
  return (vim.fn.executable("make") == 1)
end
local function _3_()
  return (require("nvterm")).setup()
end
local function _4_()
  if (require("trouble")).is_open() then
    return (require("trouble")).previous({jump = true, skip_groups = true})
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      return vim.notify(err, vim.log.levels.ERROR)
    else
      return nil
    end
  end
end
local function _7_()
  if (require("trouble")).is_open() then
    return (require("trouble")).next({jump = true, skip_groups = true})
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then
      return vim.notify(err, vim.log.levels.ERROR)
    else
      return nil
    end
  end
end
local function _10_()
  return (require("refactoring")).setup()
end
local function _11_()
end
local function _12_()
  return (require("todo-comments")).jump_next()
end
local function _13_()
  return (require("todo-comments")).jump_prev()
end
local function _14_()
  local function _15_()
    vim.cmd.hi("Cursor", "blend=100")
    return (vim.opt.guicursor):append({"a:Cursor/lCursor"})
  end
  vim.api.nvim_create_autocmd("User", {callback = _15_, pattern = "LeapEnter"})
  local function _16_()
    vim.cmd.hi("Cursor", "blend=0")
    return (vim.opt.guicursor):remove({"a:Cursor/lCursor"})
  end
  return vim.api.nvim_create_autocmd("User", {callback = _16_, pattern = "LeapLeave"})
end
local function _17_()
  local ret = {}
  for _, key in ipairs({"f", "F", "t", "T"}) do
    ret[(#ret + 1)] = {key, desc = key, mode = {"n", "x", "o"}}
  end
  return ret
end
lazy.setup({"Olical/nfnl", "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "max397574/better-escape.nvim", "rktjmp/hotpot.nvim", "MunifTanjim/nui.nvim", "Olical/aniseed", "Olical/conjure", "Olical/nvim-local-fennel", "PaterJason/cmp-conjure", "PeterRincker/vim-argumentative", "airblade/vim-gitgutter", "clojure-vim/clojure.vim", "clojure-vim/vim-jack-in", "folke/which-key.nvim", "ggandor/lightspeed.nvim", "guns/vim-sexp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/nvim-cmp", "jiangmiao/auto-pairs", "lewis6991/impatient.nvim", "marko-cerovac/material.nvim", "mbbill/undotree", "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim", {"nvim-telescope/telescope.nvim", branch = "0.1.x", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _2_}}}, {"nvim-telescope/telescope-file-browser.nvim", dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}}, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"}}, "radenling/vim-dispatch-neovim", "tpope/vim-abolish", "tpope/vim-commentary", "tpope/vim-dispatch", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-repeat", "tpope/vim-sexp-mappings-for-regular-people", "tpope/vim-sleuth", "tpope/vim-surround", "tpope/vim-unimpaired", "tpope/vim-vinegar", "w0rp/ale", "wbthomason/packer.nvim", "nvim-tree/nvim-web-devicons", "yorickpeterse/nvim-pqf", "kevinhwang91/nvim-bqf", "junegunn/fzf", "junegunn/fzf.vim", "folke/neodev.nvim", "nvim-pack/nvim-spectre", "chentoast/marks.nvim", "bakpakin/fennel.vim", "mg979/vim-visual-multi", "sindrets/diffview.nvim", "echasnovski/mini.nvim", "lukas-reineke/indent-blankline.nvim", "stevearc/dressing.nvim", {"NvChad/nvterm", config = _3_}, "EdenEast/nightfox.nvim", {"folke/trouble.nvim", cmd = {"TroubleToggle", "Trouble"}, keys = {{"<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)"}, {"<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)"}, {"<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)"}, {"<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)"}, {"[q", _4_, desc = "Previous trouble/quickfix item"}, {"]q", _7_, desc = "Next trouble/quickfix item"}}, opts = {use_diagnostic_signs = true}}, {"ThePrimeagen/refactoring.nvim", config = _10_, dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}}, "ThePrimeagen/harpoon", "onsails/lspkind.nvim", {"p00f/clangd_extensions.nvim", config = _11_, lazy = true, opts = {extensions = {ast = {kind_icons = {Compound = "\238\170\139", PackExpansion = "\238\169\188", Recovery = "\238\170\135", TemplateParamObject = "\238\170\146", TemplateTemplateParm = "\238\170\146", TemplateTypeParm = "\238\170\146", TranslationUnit = "\238\171\169"}, role_icons = {declaration = "\238\170\140", expression = "\238\169\177", specifier = "\238\174\134", statement = "\238\170\134", ["template argument"] = "\238\170\146", type = "\238\173\163"}}, inlay_hints = {inline = false}}}}, {"folke/todo-comments.nvim", cmd = {"TodoTrouble", "TodoTelescope"}, config = true, event = {"BufReadPost", "BufNewFile"}, keys = {{"]t", _12_, desc = "Next todo comment"}, {"[t", _13_, desc = "Previous todo comment"}, {"<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)"}, {"<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)"}, {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo"}, {"<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme"}}}, {"stevearc/aerial.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, opts = {}}, {"ggandor/leap.nvim", dependencies = {"tpope/vim-repeat"}, init = _14_, keys = {{"s", "<Plug>(leap-forward-to)", desc = "Leap forward to", mode = {"n", "x", "o"}}, {"S", "<Plug>(leap-backward-to)", desc = "Leap backward to", mode = {"n", "x", "o"}}, {"x", "<Plug>(leap-forward-till)", desc = "Leap forward till", mode = {"x", "o"}}, {"X", "<Plug>(leap-backward-till)", desc = "Leap backward till", mode = {"x", "o"}}, {"gs", "<Plug>(leap-from-window)", desc = "Leap from window", mode = {"n", "x", "o"}}}, opts = {}}, {"ggandor/flit.nvim", dependencies = {"ggandor/leap.nvim", dependencies = {"tpope/vim-repeat"}}, keys = _17_, opts = {labeled_modes = "nx"}}, {"folke/neodev.nvim", opts = {}}, "rafamadriz/friendly-snippets", "debugloop/telescope-undo.nvim", "nvim-tree/nvim-tree.lua", "simrat39/rust-tools.nvim"})
return {}
