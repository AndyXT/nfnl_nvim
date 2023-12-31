(local core (require :nfnl.core))
(local config (require :nfnl.config))
(local default (config.default))

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
(set vim.o.updatetime 200)
(set vim.o.timeoutlen 250)

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

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(local minis [:starter :files :misc :move :sessions :ai :pick :extra :statusline :indentscope :comment :jump "jump2d" :surround :bracketed :bufremove :splitjoin])
(each [_ value (ipairs minis)]
  (let [mod-name (.. "mini." value)
        module (require mod-name)]
      (module.setup)))

(local hipatterns (require :mini.hipatterns))
(hipatterns.setup {:highlighters {:fixme {:group :MiniHipatternsFixme
                                          :pattern "%f[%w]()FIXME()%f[%W]"}
                                  :hack {:group :MiniHipatternsHack
                                         :pattern "%f[%w]()HACK()%f[%W]"}
                                  :note {:group :MiniHipatternsNote
                                         :pattern "%f[%w]()NOTE()%f[%W]"}
                                  :todo {:group :MiniHipatternsTodo
                                         :pattern "%f[%w]()TODO()%f[%W]"}	
                                  :hex_color (hipatterns.gen_highlighter.hex_color)}})

(local miniclue (require :mini.clue))
(miniclue.setup {:window {:config {:anchor :SE :row :auto :col :auto}}
                 :clues [(miniclue.gen_clues.builtin_completion)
                         (miniclue.gen_clues.g)
                         (miniclue.gen_clues.marks)
                         (miniclue.gen_clues.registers)
                         (miniclue.gen_clues.windows)
                         (miniclue.gen_clues.z)
                         {:mode :n :keys :<LocalLeader>e :desc :+EvalConjure}
                         {:mode :n :keys :<LocalLeader>l :desc :+LogConjure}
                         {:mode :n :keys :<LocalLeader>r :desc :+REPLConjure}
                         {:mode :n :keys :<LocalLeader>t :desc :+TestConjure}
                         {:mode :n :keys :<LocalLeader>b :desc :+Buffer}
                         {:mode :n :keys :<Leader>c :desc :+Code}
                         {:mode :n :keys :<Leader>r :desc :+Refactor}
                         {:mode :n :keys :<Leader>w :desc :+Workspace}
                         {:mode :n :keys :<Leader>f :desc :+Find}
                         {:mode :n :keys :<Leader>g :desc :+Git}
                         {:mode :n :keys :<Leader>d :desc :+Document}]
                 :triggers [{:keys :<Leader> :mode :n}
                            {:keys :<Leader> :mode :x}
                            {:keys :<LocalLeader> :mode :n}
                            {:keys :<LocalLeader> :mode :x}
                            {:keys :<C-x> :mode :i}
                            {:keys "]" :mode :n}
                            {:keys "]" :mode :x}
                            {:keys "[" :mode :n}
                            {:keys "[" :mode :x}
                            {:keys :g :mode :n}
                            {:keys :g :mode :x}
                            {:keys "'" :mode :n}
                            {:keys "`" :mode :n}
                            {:keys "'" :mode :x}
                            {:keys "`" :mode :x}
                            {:keys "\"" :mode :n}
                            {:keys "\"" :mode :x}
                            {:keys :<C-r> :mode :i}
                            {:keys :<C-r> :mode :c}
                            {:keys :<C-w> :mode :n}
                            {:keys :z :mode :n}
                            {:keys :z :mode :x}]})

(vim.keymap.set :n :<LocalLeader>bd (fn [] (MiniBufremove.delete))
                {:desc "Delete"})
(vim.keymap.set :n :<LocalLeader>bw "<Cmd>lua MiniBufremove.wipeout()<CR>"
                {:desc "Wipeout"})

(let [marks (require :marks)] (marks.setup))

(let [pqf (require :pqf)] (pqf.setup))

(let [better-escape (require :better_escape)] (better-escape.setup))

(local cmp (require :cmp))
(local luasnip (require :luasnip))
((. (require :luasnip.loaders.from_vscode) :lazy_load))
(luasnip.config.setup {})
(fn has-words-before []
  (when (= (vim.api.nvim_buf_get_option 0 :buftype) :prompt)
    (lua "return false"))
  (local (line col) (unpack (vim.api.nvim_win_get_cursor 0)))
  (and (not= col 0) (= (: (. (vim.api.nvim_buf_get_text 0 (- line 1) 0 (- line 1) col {})
                             1) :match "^%s*$") nil)))
(local lspkind (require :lspkind))
(cmp.setup {:formatting {:format (lspkind.cmp_format {:before (fn [entry vim-item] vim-item)
                                                      :ellipsis_char "..."
                                                      :maxwidth 50
                                                      :mode :symbol
                                                      :symbol_map {:Copilot ""}})}
            :mapping (cmp.mapping.preset.insert 
                      {:<C-Space> (cmp.mapping.complete)
                       :<C-b> (cmp.mapping.scroll_docs (- 4))
                       :<C-e> (cmp.mapping.abort)
                       :<C-f> (cmp.mapping.scroll_docs 4)
                       :<C-n> (cmp.mapping.select_next_item)
                       :<C-p> (cmp.mapping.select_prev_item)
                       :<CR> (cmp.mapping.confirm {:select true})
                       :<S-Tab> (cmp.mapping 
                                  (fn [fallback]
                                    (if (cmp.visible)
                                      (cmp.select_prev_item)
                                      ((. (require :luasnip)
                                          :jumpable) (- 1))
                                      (vim.fn.feedkeys 
                                        (vim.api.nvim_replace_termcodes 
                                          :<Plug>luasnip-jump-prev true true true) "")
                                      (fallback)))
                                  [:i :s])
                       :<Tab> (cmp.mapping 
                                (fn [fallback]
                                  (if (and (cmp.visible)
                                         (has-words-before))
                                    (cmp.select_next_item)
                                    ((. (require :luasnip)
                                        :expand_or_jumpable))
                                    (vim.fn.feedkeys 
                                      (vim.api.nvim_replace_termcodes 
                                        :<Plug>luasnip-expand-or-jump true true true) "")
                                    (fallback)))
                                [:i :s])})
            :snippet {:expand (fn [args]
                                ((. (require :luasnip) :lsp_expand) args.body))}
            :sources (cmp.config.sources [{:name :nvim_lsp}
                                          {:name :luasnip}
                                          {:name :buffer}
                                          {:name :nvim_lua}
                                          {:name :path}
                                          {:name :copilot :group_index 2}
                                          {:name :conjure}])})
(cmp.setup.cmdline ["/" "?"]
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources [{:name :buffer}]})
(cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources (cmp.config.sources [{:name :path}]
                                                 [{:name :cmdline}])})	

(local capability (vim.lsp.protocol.make_client_capabilities))
(local capabilities ((. (require "cmp_nvim_lsp") :default_capabilities) capability))
(fn on-attach [_ bufnr]
  (fn nmap [keys func desc]
    (when desc (set-forcibly! desc (.. "LSP: " desc)))
    (vim.keymap.set :n keys func {:buffer bufnr : desc}))

  (nmap :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
  (nmap :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
  (nmap :gd vim.lsp.buf.definition "[G]oto [D]efinition")
  (nmap :gr "<cmd>Pick lsp scope='references'<CR>" 
        "[G]oto [R]eferences")
  (nmap :gI "<cmd>Pick lsp scope='implementation'<CR>"
        "[G]oto [I]mplementation")
  (nmap :<leader>D vim.lsp.buf.type_definition "Type [D]efinition")
  (nmap :<leader>ds "<cmd>Pick lsp scope='document_symbol'<CR>"
        "[D]ocument [S]ymbols")
  (nmap :<leader>ws "<cmd>Pick lsp scope='workspace_symbol'<CR>"
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

((. (require :neodev) :setup))

(let [lspconfig (require :lspconfig)]
  (let [servers [:lua_ls :gopls :fennel_language_server :clangd]]
    (each [index value (ipairs servers)]
      ((. lspconfig value :setup) {:capabilities capabilities
                                   :on_attach on_attach})))
  ((. lspconfig :racket_langserver :setup) {:capabilities capabilities
                                            :on_attach on_attach}))
                                            ;:cmd ["xvfb-run" "racket" "-l" "racket-langserver"]

(vim.keymap.set [:n :v] :<Space> :<Nop> {:silent true})
(vim.keymap.set :n :<esc> "<cmd>noh<cr>" {:silent true})
(vim.keymap.set :n :k "v:count == 0 ? 'gk' : 'k'" {:expr true :silent true})
(vim.keymap.set :n :j "v:count == 0 ? 'gj' : 'j'" {:expr true :silent true})
(local highlight-group
       (vim.api.nvim_create_augroup :YankHighlight {:clear true}))
(vim.api.nvim_create_autocmd :TextYankPost
                             {:callback (fn [] (vim.highlight.on_yank))
                              :group highlight-group
                              :pattern "*"})
(vim.keymap.set :n :<leader>? "<CMD>Pick oldfiles<CR>"
                {:desc "[?] Find recently opened files"})
(vim.keymap.set :n :<leader>b "<CMD>Pick buffers<CR>"
                {:desc "[b] Find existing buffers"})
(vim.keymap.set :n :<leader>/ "<CMD>Pick buf_lines<CR>"
                {:desc "[/] Fuzzily search in current buffer"})
(vim.keymap.set :n :<leader>gf "<CMD>Pick git_files<CR>"
                {:desc "Search [G]it [F]iles"})
(vim.keymap.set :n :<leader>ff "<CMD>Pick files<CR>"
                {:desc "[F]ind [F]iles"})
(vim.keymap.set :n :<leader>fh "<CMD>Pick help<CR>"
                {:desc "[S]earch [H]elp"})
(vim.keymap.set :n :<leader>fw "<CMD>Pick grep pattern='<cword>'<CR>"
                {:desc "[S]earch current [W]ord"})
(vim.keymap.set :n :<leader>fg "<CMD>Pick grep_live<CR>"
                {:desc "[S]earch by [G]rep"})
(vim.keymap.set :n :<leader>fd "<CMD>Pick diagnostic<CR>"
                {:desc "[S]earch [D]iagnostics"})
(vim.keymap.set :n :<leader>e (fn [] (MiniFiles.open))
                {:desc "File [e]xplorer"})
((. (require :nvim-treesitter.configs) :setup) 
  {:auto_install false
    :ensure_installed [:c :cpp :go :lua :python :rust :tsx :typescript :vimdoc :vim :scala :elixir :heex :kotlin :fennel :racket :awk :scheme]
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
((. (require :nvterm) :setup) {:behavior {:auto_insert true
                                          :autoclose_on_quit {:confirm true
                                                              :enabled false}
                                          :close_on_exit true}
                               :terminals {:list {}
                                           :shell vim.o.shell
                                           :type_opts {:float {:border :single
                                                               :col 0.25
                                                               :height 0.4
                                                               :relative :editor
                                                               :row 0.3
                                                               :width 0.5}
                                                       :horizontal {:location :rightbelow
                                                                    :split_ratio 0.3}
                                                       :vertical {:location :rightbelow
                                                                  :split_ratio 0.5}}}})
(local terminal (require :nvterm.terminal))
(local ft-cmds {:python (.. "python3 " (vim.fn.expand "%"))})
(local toggle-modes [:n :t])
(local mappings
       [[:n :<C-l> (fn [] (terminal.send (. ft-cmds vim.bo.filetype)))]
        [toggle-modes :<A-h> (fn [] (terminal.toggle :horizontal))]
        [toggle-modes :<A-v> (fn [] (terminal.toggle :vertical))]
        [toggle-modes :<A-i> (fn [] (terminal.toggle :float))]])
(local opts {:noremap true :silent true})
(each [_ mapping (ipairs mappings)]
  (vim.keymap.set (. mapping 1) (. mapping 2) (. mapping 3) opts))	

(vim.keymap.set :n :<leader>.
                (fn [] (MiniFiles.open (vim.api.nvim_buf_get_name 0) false) end)
                {:desc "File Browser Buffer CWD"})

; (vim.keymap.set :n :<leader>ha
;                 (fn []
;                   ((. (require :harpoon.mark) :add_file)))
;                 {:desc "Add File"})
; (vim.keymap.set :n :<leader>hm
;                 (fn []
;                   ((. (require :harpoon.ui) :toggle_quick_menu)))
;                 {:desc "Toggle Menu"})
; (vim.keymap.set :n :<leader>hn
;                 (fn []
;                   ((. (require :harpoon.ui) :nav_next)))
;                 {:desc "[N]ext  File"})
; (vim.keymap.set :n :<leader>hp
;                 (fn []
;                   ((. (require :harpoon.ui) :nav_prev)))
;                 {:desc "[P]revious File"})
; 
; ((. (require :refactoring) :setup) {})
; (vim.keymap.set :x :<leader>re
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Extract Function"))
;                 {:desc "Extract Function"})
; (vim.keymap.set :x :<leader>rf
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Extract Function To File"))
;                 {:desc "Extract Function to File"})
; (vim.keymap.set :x :<leader>rv
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Extract Variable"))
;                 {:desc "Extract Variable"})
; (vim.keymap.set :n :<leader>rI
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Inline Function"))
;                 {:desc "Inline Function"})
; (vim.keymap.set [:n :x] :<leader>ri
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Inline Variable"))
;                 {:desc "Inline Variable"})
; (vim.keymap.set :n :<leader>rb
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Extract Block"))
;                 {:desc "Extract Block"})
; (vim.keymap.set :n :<leader>rbf
;                 (fn []
;                   ((. (require :refactoring) :refactor) "Extract Block To File"))
;                 {:desc "Extract Block To File"})
;  ((. (require :telescope) :load_extension) :refactoring)
;  (vim.keymap.set [:n :x] :<leader>rr
;                  (fn []
;                    ((. (. (. (require :telescope) :extensions) :refactoring)
;                        :refactors)))
;                  {:desc "Select Refactor Menu"})
; (vim.keymap.set :n :<leader>rp
;                 (fn []
;                   ((. (. (require :refactoring) :debug) :printf) {:below false}))
;                 {:desc "Debug Printf"})
; (vim.keymap.set [:x :n] :<leader>rv
;                 (fn []
;                   ((. (. (require :refactoring) :debug) :print_var)))
;                 {:desc "Debug Print Var"})
; (vim.keymap.set :n :<leader>rc
;                 (fn []
;                   ((. (. (require :refactoring) :debug) :cleanup) {}))
;                 {:desc "Debug Cleanup"})
(vim.keymap.set :n "[d" vim.diagnostic.goto_prev
                {:desc "Go to previous diagnostic message"})
(vim.keymap.set :n "]d" vim.diagnostic.goto_next
                {:desc "Go to next diagnostic message"})
(vim.keymap.set :n :<leader>E vim.diagnostic.open_float
                {:desc "Open floating diagnostic message"})
(vim.keymap.set :n :<leader>q vim.diagnostic.setloclist
                {:desc "Open diagnostics list"})
(vim.keymap.set :n :<leader>z (fn [] (MiniMisc.zoom))
               {:desc "Toggle Zoom current window"})

; (set vim.g.loaded_netrw 1)
; (set vim.g.loaded_netrwPlugin 1)
(local rt (require :rust-tools))
(rt.setup {:server {:capabilities capabilities :on_attach on-attach}})

((. (require :copilot) :setup) {:copilot_node_command :node
                                :filetypes {:. false
                                            :c true
                                            :cvs false
                                            :gitcommit false
                                            :gitrebase false
                                            :go true
                                            :help false
                                            :hgcommit false
                                            :lua true
                                            :markdown false
                                            :python true
                                            :rust true
                                            :scala true
                                            :svn false
                                            :yaml false}
                                :panel {:auto_refresh true
                                        :enabled false
                                        :keymap {:accept :<CR>
                                                 :jump_next "]]"
                                                 :jump_prev "[["
                                                 :open :<M-CR>
                                                 :refresh :gr}
                                        :layout {:position :bottom :ratio 0.4}}
                                :server_opts_overrides {}
                                :suggestion {:auto_trigger false
                                             :debounce 75
                                             :enabled false
                                             :keymap {:accept :<Tab>
                                                      :accept_line false
                                                      :accept_word false
                                                      :dismiss :<C-q>
                                                      :next :<C-l>
                                                      :prev :<C-h>}}})

(vim.cmd "inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')")
(vim.cmd "if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif")
(vim.cmd "command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)")
(vim.cmd "let g:fzf_vim = {}")
(vim.cmd "let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']")
(vim.cmd "let g:pandoc#filetypes#handled = [\"pandoc\", \"markdown\"]")
(vim.cmd "let g:pandoc#filetypes#pandoc_markdown = 0")
(vim.cmd "let g:pandoc#modules#disabled = [\"folding\"]")
