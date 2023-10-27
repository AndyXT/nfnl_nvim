(local lazy (require :lazy))
(lazy.setup [
             :Olical/nfnl
             :nvim-lua/plenary.nvim
             ; :udayvir-singh/hibiscus.nvim
             ; :udayvir-singh/tangerine.nvim
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
             :guns/vim-sexp
             :hrsh7th/cmp-buffer
             :hrsh7th/cmp-cmdline
             :hrsh7th/cmp-nvim-lsp
             :hrsh7th/cmp-path
             :hrsh7th/nvim-cmp
             :jiangmiao/auto-pairs
             :lewis6991/impatient.nvim
             ;:liuchengxu/vim-better-default
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
             :stevearc/dressing.nvim
             ; :ray-x/guihua.lua {:run "cd lua/fzy && make"}
             ; :ray-x/go.nvim {:mod :go}
             ; :NvChad/nvterm {:mod :nvterm}
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
            ])
return {}
