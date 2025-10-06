# https://notashelf.github.io/nvf/index.xhtml
{pkgs}:
let 
  # pkgs = import <nixpkgs> {};
  bindgen = builtins.map (args:
    let
      key    = builtins.elemAt args 0;
      action = builtins.elemAt args 1;
      desc   = builtins.elemAt args 2;
      extras = builtins.elemAt args 3 // {};
      mode   = extras.mode or ["n"];
      silent = if builtins.hasAttr "silent" extras then extras.silent else true;
    in
      { inherit key action desc mode silent; } // (builtins.removeAttrs extras ["mode" "silent"])
  );


  # lazy = import ./lazy-gen.nix{inherit pkgs;};
  lazygen = plugins: builtins.listToAttrs (
    builtins.map (plugin:
      let
        name = plugin.name;
        pname = plugin.pname or name;
        repo = plugin.repo or name;
        branch = plugin.branch or "main";
        hash = plugin.hash or "";
        lazy_val = if builtins.hasAttr "lazy" plugin then plugin.lazy else true;
      in {
        name = name;
        value = {
          package = pkgs.vimUtils.buildVimPlugin {
            pname = pname;
            version = branch;
            src = pkgs.fetchFromGitHub {
              owner = plugin.owner;
              repo = repo;
              rev = branch;
              hash = hash;
            };
          };
          setupModule = plugin.setupModule or pname;
          lazy = lazy_val;
        };
      }
    ) plugins
  );

in 
  {
  enable = true;

  settings.vim = {
    options = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      foldmethod = "manual";
      foldlevel = 99;
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
      # fish.enable = true;
      html.enable = true;
      # jsonc.enable = true;
      java.enable = true;
      markdown.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      ts.enable = true;
    };

    keymaps = bindgen[
      # TODO: implement some of these
      # https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
      [ "<Esc>" ":noh<CR>" "General clear highlights"{} ]

      [ "<leader>gc" ":Telescope git_commits<CR>" "Telescope git commits"{} ]
      [ "<leader>gs" ":Telescope git_stash<CR>"   "Telescope git stash"{} ]
      [ "<leader>gS" ":Telescope git_status<CR>"  "Telescope git status"{} ]
      [ "<leader>gT" ":TodoTelescope<CR>"  "Telescope todo list"{} ]

      [ "<leader>q"  ":q<CR>"  "Quit file"{} ]
      [ "<leader>w"  ":w<CR>"  "Save file"{} ]
      [ "<leader>wq" ":wq<CR>" "Save and quit"{} ]

      [ "<leader>ch" ":Cheatsheet<CR>" "Cheatsheet"{}] # TODO: migrate to NvChad's 
    ];

    # https://github.com/NotAShelf/nvf/discussions/1013
    # https://notashelf.github.io/nvf/index.xhtml#sec-lazy-method
    lazy.plugins = lazygen[
      {
        name = "netrw.nvim";
        owner = "prichrd";
        branch = "master";
        hash = "sha256-tEO+omzlaC0uFkIHebeqnGtiPbDelRTBJONEnTy0F9U=";
        lazy = false;
        setupModule = "netrw";
      }
      {
        name = "devcontainer";
        owner = "esensar";
        hash = "sha256-ek/6/gBweO75JoVx9MQcnxeqkLvEDTKvGeQZnlDNCmc=";
      }
      # TODO: add
      # https://github.com/mikavilpas/yazi.nvim

      # TODO: make this one work
      {
        name = "render-markdown.nvim";
        owner = "MeanderingProgrammer";
        hash = "sha256-Smt9v6/XyHUdUiIPyCPQSRvWCeMMhYITSZWd9M7Jlvs=";
        setupModule = "render-markdown";
      }
    ];

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
      ];
    };

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
    };

    autocomplete.blink-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    diagnostics.enable = true;
    formatter.conform-nvim.enable = true;
    git.gitsigns.enable = true;
    lazy.enable = true;
    lsp.enable = true;
    lsp.trouble.enable = true;
    notes.todo-comments.enable = true;
    statusline.lualine.enable = true;
    terminal.toggleterm.enable = true;
    ui.colorizer.enable = true;
    ui.nvim-ufo.enable = true;
    utility.surround.enable = true;
    visuals.indent-blankline.enable = true;
    visuals.nvim-web-devicons.enable = true;
  };
}
