(local lazy (require :lazy))
(lazy.setup [
             :Olical/nfnl
             :nvim-lua/plenary.nvim
             :L3MON4D3/LuaSnip
             :saadparwaiz1/cmp_luasnip
             :max397574/better-escape.nvim
             :rktjmp/hotpot.nvim
             :Olical/aniseed
             :Olical/conjure
             :Olical/nvim-local-fennel
             :PaterJason/cmp-conjure
             :PeterRincker/vim-argumentative
             :airblade/vim-gitgutter
             ; :clojure-vim/clojure.vim
             ; :clojure-vim/vim-jack-in
             ; :ggandor/lightspeed.nvim
             ; :guns/vim-sexp
             :hrsh7th/cmp-buffer
             :hrsh7th/cmp-cmdline
             :hrsh7th/cmp-nvim-lsp
             :hrsh7th/cmp-path
             :hrsh7th/nvim-cmp
             ; :jiangmiao/auto-pairs
             :marko-cerovac/material.nvim
             :mbbill/undotree
             :neovim/nvim-lspconfig
             {1 :nvim-treesitter/nvim-treesitter
              :build ":TSUpdate"
              :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]}
             :radenling/vim-dispatch-neovim
             :tpope/vim-abolish
             :tpope/vim-dispatch
             :tpope/vim-eunuch
             :tpope/vim-fugitive
             :tpope/vim-repeat
             :tpope/vim-sexp-mappings-for-regular-people
             :tpope/vim-sleuth
             ; :tpope/vim-surround
             ; :tpope/vim-unimpaired
             :tpope/vim-vinegar
             :nvim-tree/nvim-web-devicons
             :yorickpeterse/nvim-pqf
             :kevinhwang91/nvim-bqf
             {1 :junegunn/fzf :build "./install --bin"}
             :junegunn/fzf.vim
             :nvim-pack/nvim-spectre
             :chentoast/marks.nvim
             :bakpakin/fennel.vim
             ; :sindrets/diffview.nvim
             :echasnovski/mini.nvim
             {1 :NvChad/nvterm
              :config (fn []
                          ((. (require :nvterm) :setup)))}
             :EdenEast/nightfox.nvim
            ; :ThePrimeagen/harpoon
            :onsails/lspkind.nvim
            {1 :p00f/clangd_extensions.nvim
             :config (fn [])
             :lazy true
             :opts {:extensions {:ast {:kind_icons {:Compound ""
                                                    :PackExpansion ""
                                                    :Recovery ""
                                                    :TemplateParamObject ""
                                                    :TemplateTemplateParm ""
                                                    :TemplateTypeParm ""
                                                    :TranslationUnit ""}
                                       :role_icons {:declaration ""
                                                    :expression ""
                                                    :specifier ""
                                                    :statement ""
                                                    "template argument" ""
                                                    :type ""}}
                                 :inlay_hints {:inline false}}}}
            {1 :stevearc/aerial.nvim
             :dependencies [:nvim-treesitter/nvim-treesitter :nvim-tree/nvim-web-devicons]
             :opts {}}
            {1 :folke/neodev.nvim :opts {}}
            :rafamadriz/friendly-snippets
            :simrat39/rust-tools.nvim
            {1 :zbirenbaum/copilot.lua
             :cmd :Copilot
             :config (fn []
                       ((. (require :copilot) :setup)))
             :event :InsertEnter}
            {1 :zbirenbaum/copilot-cmp
             :config (fn []
                       ((. (require :copilot_cmp) :setup)))}
            {1 :ray-x/go.nvim
             :build ":lua require(\"go.install\").update_all_sync()"
             :config (fn []
                       ((. (require :go) :setup)))
             :dependencies [:ray-x/guihua.lua
                            :neovim/nvim-lspconfig
                            :nvim-treesitter/nvim-treesitter]
             :event [:CmdlineEnter]
             :ft [:go :gomod]}	
            :vim-pandoc/vim-pandoc
            :vim-pandoc/vim-pandoc-syntax
            :hiphish/rainbow-delimiters.nvim
            {1 :julienvincent/nvim-paredit
             :config (fn []
                       ((. (require :nvim-paredit) :setup)))}
            {1 :ellisonleao/gruvbox.nvim :config true :opts ... :priority 1000}
            ; {1 :jackMort/ChatGPT.nvim
            ;  :config (fn []
            ;            ((. (require :chatgpt) :setup) {}))
            ;  :dependencies [:MunifTanjim/nui.nvim
            ;                 :nvim-lua/plenary.nvim
            ;                 :nvim-telescope/telescope.nvim]
            ;  :event :VeryLazy}
            :ConradIrwin/vim-bracketed-paste
            {1 :akinsho/git-conflict.nvim :config true :version "*"}
            ; :jbyuki/venn.nvim
            :mileszs/ack.vim
            ; :AndyXT/nfnl-plugin-example
            ])
return {}
