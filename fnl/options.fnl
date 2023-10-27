; (import-macros {: augroup!} :hibiscus.vim)

; (set! :shiftwidth 8)
; (set path (.. path "**"))

(local core (require :nfnl.core))
(local config (require :nfnl.config))
(local default (config.default))

(let [starter (require :mini.starter)]
  (starter.setup))

(let [marks (require :marks)]
  (marks.setup))

(let [lualine (require :lualine)]
  (lualine.setup))

(let [which-key (require :which-key)]
  (which-key.setup))

((. (require :which-key) :register) {:<leader>c {:_ :which_key_ignore
                                                 :name "[C]ode"}
                                     :<leader>d {:_ :which_key_ignore
                                                 :name "[D]ocument"}
                                     :<leader>g {:_ :which_key_ignore
                                                 :name "[G]it"}
                                     :<leader>h {:_ :which_key_ignore
                                                 :name "[H]arpoon"}
                                     :<leader>o {:_ :which_key_ignore
                                                 :name "[O]rgmode"}
                                     :<leader>r {:_ :which_key_ignore
                                                 :name "[R]ename"}
                                     :<leader>s {:_ :which_key_ignore
                                                 :name "[S]earch"}
                                     :<leader>w {:_ :which_key_ignore
                                                 :name "[W]orkspace"}
                                     :<leader>x {:_ :which_key_ignore
                                                 :name "[T]rouble"}})

(let [ibl (require :ibl)]
  (ibl.setup))

(let [pqf (require :pqf)]
  (pqf.setup))

(let [dressing (require :dressing)]
  (dressing.setup))

(let [better-escape (require :better_escape)]
  (better-escape.setup))

(let [cmp (require :cmp)]
  (cmp.setup [
              {:sources (cmp.config.sources [{:name :nvim_lsp}
                                             {:name :luasnip}
                                             {:name :buffer}
                                             {:name :nvim_lua}
                                             {:name :path}])}
              ])
  (cmp.setup.cmdline ["/" "?"] [
                              {:mapping cmp.mapping.preset.cmdline}
                              {:sources (cmp.config.sources [{:name :path}] [{:name :cmdline}])}  
                                ]))

(local capability (vim.lsp.protocol.make_client_capabilities))
(local capabilities ((. (require "cmp_nvim_lsp") :default_capabilities) capability))
(fn on-attach [_ bufnr]
  (fn nmap [keys func desc]
    (when desc (set-forcibly! desc (.. "LSP: " desc)))
    (vim.keymap.set :n keys func {:buffer bufnr : desc}))

  (nmap :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
  (nmap :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
  (nmap :gd vim.lsp.buf.definition "[G]oto [D]efinition")
  (nmap :gr (. (require :telescope.builtin) :lsp_references)
        "[G]oto [R]eferences")
  (nmap :gI (. (require :telescope.builtin) :lsp_implementations)
        "[G]oto [I]mplementation")
  (nmap :<leader>D vim.lsp.buf.type_definition "Type [D]efinition")
  (nmap :<leader>ds (. (require :telescope.builtin) :lsp_document_symbols)
        "[D]ocument [S]ymbols")
  (nmap :<leader>ws (. (require :telescope.builtin)
                       :lsp_dynamic_workspace_symbols)
        "[W]orkspace [S]ymbols")
  (nmap :K vim.lsp.buf.hover "Hover Documentation")
  (nmap :<C-k> vim.lsp.buf.signature_help "Signature Documentation")
  (nmap :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")
  (nmap :<leader>wa vim.lsp.buf.add_workspace_folder "[W]orkspace [A]dd Folder")
  (nmap :<leader>wr vim.lsp.buf.remove_workspace_folder
        "[W]orkspace [R]emove Folder")
  (nmap :<leader>wl
        (fn []
          (print (vim.inspect (vim.lsp.buf.list_workspace_folders))))
        "[W]orkspace [L]ist Folders")
  (vim.api.nvim_buf_create_user_command bufnr :Format
                                        (fn [_] (vim.lsp.buf.format))
                                        {:desc "Format current buffer with LSP"}))

(let [lspconfig (require :lspconfig)]
  (let [servers [:lua_ls :gopls :fennel_language_server]]
    (each [index value (ipairs servers)]
      ((. lspconfig value :setup) {:capabilities capabilities
                                   :on_attach on_attach}))))

(pcall (. (require :telescope) :load_extension) :fzf)	

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.wo.number true)
(set vim.o.mouse "a")
(set vim.o.clipboard "unnamedplus")

(set vim.o.breakindent true)

;; Case-insensitive searching UNLESS \C or capital in search
(set vim.o.ignorecase true)
(set vim.o.smartcase true)

;; Keep signcolumn on by default
(set vim.wo.signcolumn "yes")

;; Decrease update time
(set vim.o.updatetime 250)
(set vim.o.timeoutlen 300)

;; Set completeopt to have a better completion experience
(set vim.o.completeopt "menuone,noselect")

;; NOTE: You should make sure your terminal supports this
(set vim.o.termguicolors true)
(set vim.opt.tabstop 4)
(set vim.opt.softtabstop 4)
(set vim.opt.shiftwidth 4)
(set vim.o.expandtab true)

(set vim.opt.swapfile false)
(set vim.opt.backup false)
(set vim.opt.undodir (.. (os.getenv :HOME) :/.vim/undodir))
(set vim.opt.undofile true)

(vim.keymap.set [:n :v] :<Space> :<Nop> {:silent true})
(vim.keymap.set :n :k "v:count == 0 ? 'gk' : 'k'" {:expr true :silent true})
(vim.keymap.set :n :j "v:count == 0 ? 'gj' : 'j'" {:expr true :silent true})
(local highlight-group
       (vim.api.nvim_create_augroup :YankHighlight {:clear true}))
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :group highlight-group
                              :pattern "*"})
((. (require :telescope) :setup) {:defaults {:mappings {:i {:<C-d> false
                                                            :<C-u> false}}}})
(vim.keymap.set :n :<leader>? (. (require :telescope.builtin) :oldfiles)
                {:desc "[?] Find recently opened files"})
(vim.keymap.set :n :<leader>b (. (require :telescope.builtin) :buffers)
                {:desc "[ ] Find existing buffers"})
(vim.keymap.set :n :<leader>/
                (fn []
                  ((. (require :telescope.builtin) :current_buffer_fuzzy_find)
                    ((. (require :telescope.themes) :get_dropdown)
                      {:previewer false :winblend 10})))
                {:desc "[/] Fuzzily search in current buffer"})

(vim.keymap.set :n :<leader>gf (. (require :telescope.builtin) :git_files)
                {:desc "Search [G]it [F]iles"})
(vim.keymap.set :n :<leader>sf (. (require :telescope.builtin) :find_files)
                {:desc "[S]earch [F]iles"})
(vim.keymap.set :n :<leader>sh (. (require :telescope.builtin) :help_tags)
                {:desc "[S]earch [H]elp"})
(vim.keymap.set :n :<leader>sw (. (require :telescope.builtin) :grep_string)
                {:desc "[S]earch current [W]ord"})
(vim.keymap.set :n :<leader>sg (. (require :telescope.builtin) :live_grep)
                {:desc "[S]earch by [G]rep"})
(vim.keymap.set :n :<leader>sd (. (require :telescope.builtin) :diagnostics)
                {:desc "[S]earch [D]iagnostics"})
((. (require :nvim-treesitter.configs) :setup) 
  {:auto_install false
    :ensure_installed [:c :cpp :go :lua :python :rust :tsx :typescript :vimdoc :vim :scala :elixir :heex :kotlin :fennel]
    :highlight {:enable true}
    :incremental_selection {:enable true
                            :keymaps {:init_selection :<c-space>
                                      :node_decremental :<M-space>
                                      :node_incremental :<c-space>
                                      :scope_incremental :<c-s>}}
    :indent {:enable true}
    :textobjects {:move {:enable true
                         :goto_next_end {"]M" "@function.outer"
                                         "][" "@class.outer"}
                         :goto_next_start {"]]" "@class.outer"
                                           "]m" "@function.outer"}
                         :goto_previous_end {"[M" "@function.outer"
                                             "[]" "@class.outer"}
                         :goto_previous_start {"[[" "@class.outer" 
                                               "[m" "@function.outer"}
                         :set_jumps true}
                  :select {:enable true
                           :keymaps {:aa "@parameter.outer"
                           :ac "@class.outer"
                           :af "@function.outer"
                           :ia "@parameter.inner"
                           :ic "@class.inner"
                           :if "@function.inner"}
                           :lookahead true}
                  :swap {:enable true
                         :swap_next {:<leader>a "@parameter.inner"}
                         :swap_previous {:<leader>A "@parameter.inner"}}}})
