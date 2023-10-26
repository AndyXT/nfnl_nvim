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

(let [ibl (require :ibl)]
  (ibl.setup))

(let [pqf (require :pqf)]
  (pqf.setup))

(let [dressing (require :dressing)]
  (dressing.setup))

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
