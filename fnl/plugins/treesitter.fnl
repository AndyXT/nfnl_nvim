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
