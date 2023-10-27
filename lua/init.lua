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
local function _6_()
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
lazy.setup({"Olical/nfnl", "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "max397574/better-escape.nvim", "rktjmp/hotpot.nvim", "MunifTanjim/nui.nvim", "Olical/aniseed", "Olical/conjure", "Olical/nvim-local-fennel", "PaterJason/cmp-conjure", "PeterRincker/vim-argumentative", "airblade/vim-gitgutter", "clojure-vim/clojure.vim", "clojure-vim/vim-jack-in", "folke/which-key.nvim", "ggandor/lightspeed.nvim", "guns/vim-sexp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/nvim-cmp", "jiangmiao/auto-pairs", "lewis6991/impatient.nvim", "marko-cerovac/material.nvim", "mbbill/undotree", "neovim/nvim-lspconfig", "nvim-lualine/lualine.nvim", {"nvim-telescope/telescope.nvim", branch = "0.1.x", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = _2_}}}, "nvim-treesitter/nvim-treesitter", "radenling/vim-dispatch-neovim", "tpope/vim-abolish", "tpope/vim-commentary", "tpope/vim-dispatch", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-repeat", "tpope/vim-sexp-mappings-for-regular-people", "tpope/vim-sleuth", "tpope/vim-surround", "tpope/vim-unimpaired", "tpope/vim-vinegar", "w0rp/ale", "wbthomason/packer.nvim", "nvim-tree/nvim-web-devicons", "yorickpeterse/nvim-pqf", "kevinhwang91/nvim-bqf", "junegunn/fzf", "junegunn/fzf.vim", "folke/neodev.nvim", "nvim-pack/nvim-spectre", "chentoast/marks.nvim", "bakpakin/fennel.vim", "mg979/vim-visual-multi", "sindrets/diffview.nvim", "echasnovski/mini.nvim", "lukas-reineke/indent-blankline.nvim", "stevearc/dressing.nvim", "EdenEast/nightfox.nvim", {"folke/trouble.nvim", cmd = {"TroubleToggle", "Trouble"}, keys = {{"<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)"}, {"<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)"}, {"<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)"}, {"<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)"}, {"[q", _3_, desc = "Previous trouble/quickfix item"}, {"]q", _6_, desc = "Next trouble/quickfix item"}}, opts = {use_diagnostic_signs = true}}})
return {}
