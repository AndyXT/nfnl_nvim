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
