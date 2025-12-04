# https://notashelf.github.io/nvf/index.xhtml
{ pkgs, nvf }:
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
  {
  enable = true;

  settings.vim = {
    lazy = import ./lazy.nix{inherit pkgs nvf;};

    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      foldmethod = "manual";
      foldlevel = 99;

      shell = "${pkgs.fish}/bin/fish";
    };

    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };

    languages = {
      enableTreesitter = true;

      bash.enable = true;
      html.enable = true;
      java.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      # [wait until fixed](https://github.com/NotAShelf/nvf/issues/920)
      # sql.enable = true;
      ts.enable = true;
    };

    keymaps = bindgen[
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
    ];
     
    # https://github.com/NotAShelf/nvf/discussions/1013
    # https://notashelf.github.io/nvf/index.xhtml#sec-lazy-method


    treesitter = {
      enable = true;
      fold = true;
      context.enable = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };

    telescope = {
      enable = true;
      setupOpts.defaults.file_ignore_patterns = [
        "node_modules"
        "%.git/"
        "dist/"
        "build/"
        "target/"
        "result/"
        "_site/"
        "%.pyc"
      ];
    };

    diagnostics = {
      enable = true;
      config = {
        update_in_insert = true;
        virtual_text = true;
      };
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # TODO: continue
    terminal.toggleterm = {
      enable = true;
      setupOpts.enable.winbar = true;
    };

    autocomplete.blink-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    formatter.conform-nvim.enable = true;
    git.gitsigns.enable = true;
    lsp.enable = true;
    lsp.trouble.enable = true;
    notes.todo-comments.enable = true;
    statusline.lualine.enable = true;
    ui.colorizer.enable = true;
    ui.nvim-ufo.enable = true;
    utility.surround.enable = true;
    utility.yazi-nvim.enable = true;
    visuals.indent-blankline.enable = true;
    visuals.nvim-web-devicons.enable = true;
  };
}
