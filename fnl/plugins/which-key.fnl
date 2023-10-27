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
