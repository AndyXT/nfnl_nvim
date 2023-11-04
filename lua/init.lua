-- [nfnl] Compiled from fnl/init.fnl by https://github.com/Olical/nfnl, do not edit.
local lazy = require("lazy")
local function _1_()
  return (require("nvterm")).setup()
end
local function _2_()
end
local function _3_()
  return (require("copilot")).setup()
end
local function _4_()
  return (require("copilot_cmp")).setup()
end
local function _5_()
  return (require("go")).setup()
end
local function _6_()
  return (require("nvim-paredit")).setup()
end
lazy.setup({"Olical/nfnl", "nvim-lua/plenary.nvim", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "max397574/better-escape.nvim", "rktjmp/hotpot.nvim", "Olical/aniseed", "Olical/conjure", "Olical/nvim-local-fennel", "PaterJason/cmp-conjure", "PeterRincker/vim-argumentative", "airblade/vim-gitgutter", "hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/nvim-cmp", "marko-cerovac/material.nvim", "mbbill/undotree", "neovim/nvim-lspconfig", {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"}}, "radenling/vim-dispatch-neovim", "tpope/vim-abolish", "tpope/vim-dispatch", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-repeat", "tpope/vim-sexp-mappings-for-regular-people", "tpope/vim-sleuth", "tpope/vim-surround", "tpope/vim-unimpaired", "tpope/vim-vinegar", "nvim-tree/nvim-web-devicons", "yorickpeterse/nvim-pqf", "kevinhwang91/nvim-bqf", {"junegunn/fzf", build = "./install --bin"}, "junegunn/fzf.vim", "nvim-pack/nvim-spectre", "chentoast/marks.nvim", "bakpakin/fennel.vim", "echasnovski/mini.nvim", {"NvChad/nvterm", config = _1_}, "EdenEast/nightfox.nvim", "onsails/lspkind.nvim", {"p00f/clangd_extensions.nvim", config = _2_, lazy = true, opts = {extensions = {ast = {kind_icons = {Compound = "\238\170\139", PackExpansion = "\238\169\188", Recovery = "\238\170\135", TemplateParamObject = "\238\170\146", TemplateTemplateParm = "\238\170\146", TemplateTypeParm = "\238\170\146", TranslationUnit = "\238\171\169"}, role_icons = {declaration = "\238\170\140", expression = "\238\169\177", specifier = "\238\174\134", statement = "\238\170\134", ["template argument"] = "\238\170\146", type = "\238\173\163"}}, inlay_hints = {inline = false}}}}, {"stevearc/aerial.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, opts = {}}, {"folke/neodev.nvim", opts = {}}, "rafamadriz/friendly-snippets", "simrat39/rust-tools.nvim", {"zbirenbaum/copilot.lua", cmd = "Copilot", config = _3_, event = "InsertEnter"}, {"zbirenbaum/copilot-cmp", config = _4_}, {"ray-x/go.nvim", build = ":lua require(\"go.install\").update_all_sync()", config = _5_, dependencies = {"ray-x/guihua.lua", "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter"}, event = {"CmdlineEnter"}, ft = {"go", "gomod"}}, "vim-pandoc/vim-pandoc", "vim-pandoc/vim-pandoc-syntax", "hiphish/rainbow-delimiters.nvim", {"julienvincent/nvim-paredit", config = _6_}, {"ellisonleao/gruvbox.nvim", config = true, opts = ..., priority = 1000}, "ConradIrwin/vim-bracketed-paste", {"akinsho/git-conflict.nvim", config = true, version = "*"}, "mileszs/ack.vim"})
return {}
