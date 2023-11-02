(local lazy (require :lazy))
(lazy.setup [
             :Olical/nfnl
             :nvim-lua/plenary.nvim
             :L3MON4D3/LuaSnip
             :saadparwaiz1/cmp_luasnip
             :max397574/better-escape.nvim
             :rktjmp/hotpot.nvim
             :MunifTanjim/nui.nvim
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
             ; :guns/vim-sexp
             ;:wlangstroth/vim-racket
             :hrsh7th/cmp-buffer
             :hrsh7th/cmp-cmdline
             :hrsh7th/cmp-nvim-lsp
             :hrsh7th/cmp-path
             :hrsh7th/nvim-cmp
             :jiangmiao/auto-pairs
             :lewis6991/impatient.nvim
             :marko-cerovac/material.nvim
             :mbbill/undotree
             :neovim/nvim-lspconfig
             :nvim-lualine/lualine.nvim
             {1 :nvim-telescope/telescope.nvim
              :branch :0.1.x
              :config (lambda []
                          ((. (require :telescope) :setup) {:extensions {:undo {:layout_config {:preview_height 0.8}
                                                                                :layout_strategy :vertical
                                                                                :side_by_side true}}})
                          ((. (require :telescope) :load_extension) :undo)
                          (vim.keymap.set :n :<leader>u "<cmd>Telescope undo<cr>"))
              :dependencies [:nvim-lua/plenary.nvim
                             :debugloop/telescope-undo.nvim
                             {1 :nvim-telescope/telescope-fzf-native.nvim
                              :build :make
                              :cond (fn [] (= (vim.fn.executable :make) 1))}]}
             {1 :nvim-telescope/telescope-file-browser.nvim
             :dependencies [:nvim-telescope/telescope.nvim :nvim-lua/plenary.nvim]}
             {1 :nvim-treesitter/nvim-treesitter
              :build ":TSUpdate"
              :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]}
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
             {1 :junegunn/fzf :build "./install --bin"}
             :junegunn/fzf.vim
             :folke/neodev.nvim
             :nvim-pack/nvim-spectre
             :chentoast/marks.nvim
             :bakpakin/fennel.vim
             :mg979/vim-visual-multi
             :sindrets/diffview.nvim
             :echasnovski/mini.nvim
             :lukas-reineke/indent-blankline.nvim
             :stevearc/dressing.nvim
             {1 :NvChad/nvterm
              :config (fn []
                          ((. (require :nvterm) :setup)))}
             :EdenEast/nightfox.nvim
             {1 :folke/trouble.nvim
              :cmd [:TroubleToggle :Trouble]
              :keys [{1 :<leader>xx
                      2 "<cmd>TroubleToggle document_diagnostics<cr>"
                      :desc "Document Diagnostics (Trouble)"}
                     {1 :<leader>xX
                      2 "<cmd>TroubleToggle workspace_diagnostics<cr>"
                      :desc "Workspace Diagnostics (Trouble)"}
                     {1 :<leader>xL
                      2 "<cmd>TroubleToggle loclist<cr>"
                      :desc "Location List (Trouble)"}
                     {1 :<leader>xQ
                      2 "<cmd>TroubleToggle quickfix<cr>"
                      :desc "Quickfix List (Trouble)"}
                     {1 "[q"
                      2 (fn []
                            (if ((. (require :trouble) :is_open))
                                ((. (require :trouble) :previous) {:jump true
                                                                   :skip_groups true})
                                (do
                                    (local (ok err) (pcall vim.cmd.cprev))
                                    (when (not ok) (vim.notify err vim.log.levels.ERROR)))))
                      :desc "Previous trouble/quickfix item"}
                     {1 "]q"
                      2 (fn []
                            (if ((. (require :trouble) :is_open))
                                ((. (require :trouble) :next) {:jump true :skip_groups true})
                                (do
                                    (local (ok err) (pcall vim.cmd.cnext))
                                    (when (not ok) (vim.notify err vim.log.levels.ERROR)))))
                      :desc "Next trouble/quickfix item"}]
              :opts {:use_diagnostic_signs true}}
            {1 :ThePrimeagen/refactoring.nvim
             :config (fn []
             ((. (require :refactoring) :setup)))
             :dependencies [:nvim-lua/plenary.nvim :nvim-treesitter/nvim-treesitter]}
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
            {1 :folke/todo-comments.nvim
             :cmd [:TodoTrouble :TodoTelescope]
             :config true
             :event [:BufReadPost :BufNewFile]
             :keys [{1 "]t"
                     2 (fn []
                         ((. (require :todo-comments) :jump_next)))
                     :desc "Next todo comment"}
                    {1 "[t"
                     2 (fn []
                         ((. (require :todo-comments) :jump_prev)))
                     :desc "Previous todo comment"}
                    {1 :<leader>xt 2 :<cmd>TodoTrouble<cr> :desc "Todo (Trouble)"}
                    {1 :<leader>xT
                     2 "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>"
                     :desc "Todo/Fix/Fixme (Trouble)"}
                    {1 :<leader>st 2 :<cmd>TodoTelescope<cr> :desc :Todo}
                    {1 :<leader>sT
                     2 "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>"
                     :desc :Todo/Fix/Fixme}]}
            {1 :stevearc/aerial.nvim
             :dependencies [:nvim-treesitter/nvim-treesitter :nvim-tree/nvim-web-devicons]
             :opts {}}
            {1 :ggandor/leap.nvim
             :dependencies [:tpope/vim-repeat]
             :init (fn []
                     (vim.api.nvim_create_autocmd :User
                                                  {:callback (fn []
                                                               (vim.cmd.hi :Cursor
                                                                           :blend=100)
                                                               (vim.opt.guicursor:append ["a:Cursor/lCursor"]))
                                                   :pattern :LeapEnter})
                     (vim.api.nvim_create_autocmd :User
                                                  {:callback (fn []
                                                               (vim.cmd.hi :Cursor :blend=0)
                                                               (vim.opt.guicursor:remove ["a:Cursor/lCursor"]))
                                                   :pattern :LeapLeave}))
             :keys [{1 :s
                     2 "<Plug>(leap-forward-to)"
                     :desc "Leap forward to"
                     :mode [:n :x :o]}
                    {1 :S
                     2 "<Plug>(leap-backward-to)"
                     :desc "Leap backward to"
                     :mode [:n :x :o]}
                    {1 :x
                     2 "<Plug>(leap-forward-till)"
                     :desc "Leap forward till"
                     :mode [:x :o]}
                    {1 :X
                     2 "<Plug>(leap-backward-till)"
                     :desc "Leap backward till"
                     :mode [:x :o]}
                    {1 :gs
                     2 "<Plug>(leap-from-window)"
                     :desc "Leap from window"
                     :mode [:n :x :o]}]
             :opts {}}
            {1 :ggandor/flit.nvim
             :dependencies {1 :ggandor/leap.nvim :dependencies [:tpope/vim-repeat]}
             :keys (fn []
                     (local ret {})
                     (each [_ key (ipairs [:f :F :t :T])]
                       (tset ret (+ (length ret) 1) {1 key :desc key :mode [:n :x :o]}))
                     ret)
             :opts {:labeled_modes :nx}}
            {1 :folke/neodev.nvim :opts {}}
            :rafamadriz/friendly-snippets
            :debugloop/telescope-undo.nvim
            :nvim-tree/nvim-tree.lua
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
            :godlygeek/tabular
            ; :preservim/vim-markdown
            :vim-pandoc/vim-pandoc
            :vim-pandoc/vim-pandoc-syntax
            :williamboman/mason.nvim
            :hiphish/rainbow-delimiters.nvim
            {1 :julienvincent/nvim-paredit
             :config (fn []
                       ((. (require :nvim-paredit) :setup)))}
            {1 :ellisonleao/gruvbox.nvim :config true :opts ... :priority 1000}
            {1 :jackMort/ChatGPT.nvim
             :config (fn []
                       ((. (require :chatgpt) :setup) {}))
             :dependencies [:MunifTanjim/nui.nvim
                            :nvim-lua/plenary.nvim
                            :nvim-telescope/telescope.nvim]
             :event :VeryLazy}
            :ConradIrwin/vim-bracketed-paste
            {1 :akinsho/git-conflict.nvim :config true :version "*"}
            :olacin/telescope-cc.nvim
            :monkoose/nvlime
            :anuvyklack/hydra.nvim
            :jbyuki/venn.nvim
            :mileszs/ack.vim
            ])
return {}
