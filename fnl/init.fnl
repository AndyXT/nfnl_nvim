(local lazy (require :lazy)) ; bootstraps packer

(lazy.setup [
             :Olical/nfnl
	     :Olical/aniseed
	     :Olical/conjure
	     :Olical/nvim-local-fennel
	     :PaterJason/cmp-conjure
	     :PeterRincker/vim-argumentative
	     :airblade/vim-gitgutter
	     :clojure-vim/clojure.vim
	     :clojure-vim/vim-jack-in
	     :folke/which-key.nvim
	     :ggandor/lightspeed.nvim
	     :guns/vim-sexp
	     :hrsh7th/cmp-buffer
	     :hrsh7th/cmp-cmdline
	     :hrsh7th/cmp-nvim-lsp
	     :hrsh7th/cmp-path
	     :hrsh7th/nvim-cmp
	     :jiangmiao/auto-pairs
	     :lewis6991/impatient.nvim
	     :liuchengxu/vim-better-default
	     :marko-cerovac/material.nvim
	     :mbbill/undotree
	     :neovim/nvim-lspconfig
	     :nvim-lualine/lualine.nvim
	     :nvim-telescope/telescope.nvim
	     :nvim-treesitter/nvim-treesitter
	     :radenling/vim-dispatch-neovim
	     :tpope/vim-abolish
	     :tpope/vim-commentary
	     :tpope/vim-dispatch
	     :tpope/vim-eunuch
	     :tpope/vim-fugitive
	     :tpope/vim-repeat
	     :tpope/vim-sexp-mappings-for-regular-people
	     :tpope/vim-sleuth
	     :tpope/vim-surround
	     :tpope/vim-unimpaired
	     :tpope/vim-vinegar
	     :w0rp/ale
	     :wbthomason/packer.nvim
	     :nvim-tree/nvim-web-devicons
	     :yorickpeterse/nvim-pqf
	     :kevinhwang91/nvim-bqf
	     :junegunn/fzf
	     :junegunn/fzf.vim
	     :folke/neodev.nvim
	     :nvim-pack/nvim-spectre
	     :chentoast/marks.nvim
	     :bakpakin/fennel.vim
	     :mg979/vim-visual-multi
	     :sindrets/diffview.nvim
	     :echasnovski/mini.nvim
	     :lukas-reineke/indent-blankline.nvim
	     ; :ray-x/guihua.lua {:run "cd lua/fzy && make"}
	     ; :ray-x/go.nvim {:mod :go}
	     ; :NvChad/nvterm {:mod :nvterm}
	     :EdenEast/nightfox.nvim
	     ])
return {}
