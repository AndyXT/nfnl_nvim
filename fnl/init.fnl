(local lazy (require :lazy))
(lazy.setup [
             :Olical/nfnl
             :nvim-lua/plenary.nvim
             :L3MON4D3/LuaSnip
             :saadparwaiz1/cmp_luasnip
             :max397574/better-escape.nvim
             :rktjmp/hotpot.nvim
             :Olical/aniseed
             {1 :Olical/conjure
              :config (fn [_ opts]
                        ((. (require :conjure.main) :main))
                        ((. (require :conjure.mapping) :on-filetype)))
              :dependencies [{1 :PaterJason/cmp-conjure
                              :config (fn []
                                        (local cmp (require :cmp))
                                        (local config (cmp.get_config))
                                        (table.insert config.sources
                                                      {:name :buffer
                                                       :option {:sources [{:name :conjure}]}})
                                        (cmp.setup config))}]
              :ft [:clojure :fennel :python]
              :init (fn [] (tset vim.g "conjure#debug" true))}
             :Olical/nvim-local-fennel
             :PaterJason/cmp-conjure
             :PeterRincker/vim-argumentative
             :airblade/vim-gitgutter
             :hrsh7th/cmp-buffer
             :hrsh7th/cmp-cmdline
             :hrsh7th/cmp-nvim-lsp
             :hrsh7th/cmp-path
             :hrsh7th/nvim-cmp
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
             :tpope/vim-vinegar
             :nvim-tree/nvim-web-devicons
             :yorickpeterse/nvim-pqf
             :kevinhwang91/nvim-bqf
             ; {1 :junegunn/fzf :build "./install --bin"}
             {1 :junegunn/fzf :build (fn [] ((. vim.fn "fzf#install")))}
             ; :junegunn/fzf.vim
             {1 :linrongbin16/fzfx.nvim
              :config (fn []
                        ((. (require :fzfx) :setup)))
              :dependencies [:junegunn/fzf :nvim-tree/nvim-web-devicons]}
             :nvim-pack/nvim-spectre
             :chentoast/marks.nvim
             :bakpakin/fennel.vim
             :sindrets/diffview.nvim
             :echasnovski/mini.nvim
             {1 :NvChad/nvterm
              :config (fn []
                          ((. (require :nvterm) :setup)))}
             :EdenEast/nightfox.nvim
             :ThePrimeagen/harpoon
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
             ; :simrat39/rust-tools.nvim
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
             :mileszs/ack.vim
             :folke/tokyonight.nvim
             :oxfist/night-owl.nvim
             :miikanissi/modus-themes.nvim
             :cryptomilk/nightcity.nvim
             {1 :nvimdev/lspsaga.nvim
              :config (fn []
                        ((. (require :lspsaga) :setup) {}))
              :dependencies [:nvim-treesitter/nvim-treesitter :nvim-tree/nvim-web-devicons]}
             :rebelot/kanagawa.nvim
             :rose-pine/neovim
             ; {1 :mrcjkb/rustaceanvim :ft [:rust] :version :^3}
             {1 :smoka7/hop.nvim :opts {} :version "*"}
             :nvim-lualine/lualine.nvim
             :mfussenegger/nvim-dap
             :rcarriga/nvim-dap-ui
             {1 :theHamsta/nvim-dap-virtual-text
              :config (fn []
                        ((. (require :nvim-dap-virtual-text) :setup) {}))}
            ])
{}
