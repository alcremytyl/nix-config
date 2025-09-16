# https://notashelf.github.io/nvf/index.xhtml
let 
  bindgen = import ../lib/nvim-bindgen.nix;
  pkgs = import <nixpkgs> {};
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
      markdown.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      ts.enable = true;
    };

    keymaps = [
      # TODO: implement some of these
      # https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
      (bindgen "<Esc>" ":noh<CR>" "General clear highlights"{})

      (bindgen "<leader>gc" ":Telescope git_commits<CR>" "Telescope git commits"{})
      (bindgen "<leader>gs" ":Telescope git_stash<CR>"   "Telescope git stash"{})
      (bindgen "<leader>gS" ":Telescope git_status<CR>"  "Telescope git status"{})
      (bindgen "<leader>gT" ":TodoTelescope<CR>"  "Telescope todo list"{})

      (bindgen "<leader>q"  ":q<CR>"  "Quit file"{})
      (bindgen "<leader>w"  ":w<CR>"  "Save file"{})
      (bindgen "<leader>wq" ":wq<CR>" "Save and quit"{})

      (bindgen "<leader>ch" ":Cheatsheet<CR>" "Cheatsheet"{}) # TODO: migrate to NvChad's 
    ];

    # https://github.com/NotAShelf/nvf/discussions/1013
    # https://notashelf.github.io/nvf/index.xhtml#sec-lazy-method
    lazy.plugins = {
      "netrw.nvim" = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "netrw.nvim";
          version = "master";
          src = pkgs.fetchFromGitHub {
            owner = "prichrd";
            repo = "netrw.nvim";
            rev = "master";
            hash = "sha256-tEO+omzlaC0uFkIHebeqnGtiPbDelRTBJONEnTy0F9U=";
          };
        };
        setupModule = "netrw";
        lazy = false;
      };
      "devcontainer" = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "devcontainer";
          version = "main";
          src = pkgs.fetchFromGitHub {
            owner = "esensar";
            repo = "nvim-dev-container";
            rev = "main";
            hash = "sha256-ek/6/gBweO75JoVx9MQcnxeqkLvEDTKvGeQZnlDNCmc=";
          };
        };
        setupModule = "devcontainer";
      };
    };

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

    autocomplete.blink-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    clipboard.enable = true;
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
