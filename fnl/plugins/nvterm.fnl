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
