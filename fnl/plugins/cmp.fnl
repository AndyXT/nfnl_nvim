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
            :mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete)
                                                 :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                 :<C-e> (cmp.mapping.abort)
                                                 :<C-f> (cmp.mapping.scroll_docs 4)
                                                 :<C-n> (cmp.mapping.select_next_item)
                                                 :<C-p> (cmp.mapping.select_prev_item)
                                                 :<CR> (cmp.mapping.confirm {:select true})
                                                 :<S-Tab> (cmp.mapping (fn [fallback]
                                                                         (if (cmp.visible)
                                                                             (cmp.select_prev_item)
                                                                             ((. (require :luasnip)
                                                                                 :jumpable) (- 1))
                                                                             (vim.fn.feedkeys 
                                                                               (vim.api.nvim_replace_termcodes 
                                                                                 :<Plug>luasnip-jump-prev true true true) "")
                                                                             (fallback)))
                                                                       [:i :s])
                                                 :<Tab> (cmp.mapping (fn [fallback]
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
            :sources (cmp.config.sources [{:group_index 2 :name :copilot}
                                          {:name :nvim_lsp}
                                          {:name :luasnip}
                                          {:name :buffer}
                                          {:name :nvim_lua}
                                          {:name :path}
                                          {:name :conjure}])})
(cmp.setup.cmdline ["/" "?"]
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources [{:name :buffer}]})
(cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                    :sources (cmp.config.sources [{:name :path}]
                                                 [{:name :cmdline}])})	
