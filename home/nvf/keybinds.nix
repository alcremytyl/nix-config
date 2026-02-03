let 
  bindgen = builtins.map (args:
    let
      mode   = builtins.elemAt args 0;
      key    = builtins.elemAt args 1;
      action = builtins.elemAt args 2;
      desc   = builtins.elemAt args 3;
      extras = builtins.elemAt args 4 // {};
      # silent = if builtins.hasAttr "silent" extras then extras.silent else true;
    in
      { inherit mode key action desc; silent = true; } // extras 
    );


in 
bindgen[
      [ "n" "<Esc>" ":noh<CR>" "General clear highlights"{} ]

      [ "n" "<leader>gc" ":Telescope git_commits<CR>" "Telescope git commits"{} ]
      [ "n" "<leader>gs" ":Telescope git_stash<CR>"   "Telescope git stash"{} ]
      [ "n" "<leader>gS" ":Telescope git_status<CR>"  "Telescope git status"{} ]
      [ "n" "<leader>gT" ":TodoTelescope<CR>"         "Telescope todo list"{} ]

      [ "n" "<leader>fd" ":Yazi<CR>" "Yazi open"{} ]

      [ "n" "<leader>q"  ":q<CR>"  "Quit file"{} ]
      [ "n" "<leader>w"  ":w<CR>"  "Save file"{} ]
      [ "n" "<leader>wq" ":wq<CR>" "Save and quit"{} ]

      [ "n" "<leader>ch" ":Cheatsheet<CR>" "Cheatsheet"{} ] # TODO: migrate to NvChad's 

      [ "n" "<leader>b" ":enew<CR>" "Buffer new"{} ]
      [ "n" "<leader>x" ":bd<CR>"   "Buffer close"{} ]

      [ "n" "<leader>v" ":ToggleTerm direction=vertical<CR>"   "Terminal vertical"{} ]
      [ "n" "<leader>h" ":ToggleTerm direction=horizontal<CR>" "Terminal horizontal"{} ]
      [ "t" "<C-x>" "<C-\\><C-N>" "Terminal escape" { } ]
    ]

