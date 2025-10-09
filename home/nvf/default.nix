# https://notashelf.github.io/nvf/index.xhtml
{ pkgs }:
let 
  bindgen = import ./keybind-gen.nix;
  lazygen = import ./lazy-gen.nix{inherit pkgs;};
  inherit (pkgs.lib.nvim.binds) mkKeymap ;
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
      html.enable = true;
      java.enable = true;
      markdown.enable = true;
      markdown.extensions.render-markdown-nvim.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      ts.enable = true;
    };

    # TODO: change this to use mkKeymap
    # https://notashelf.github.io/nvf/index.xhtml#sec-custom-key-mappings

    # keymaps = builtins.map () [

    # ];

    keymaps = bindgen[
      # TODO: implement some of these
      # https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
      [ "<Esc>" ":noh<CR>" "General clear highlights"{} ]

      [ "<leader>gc" ":Telescope git_commits<CR>" "Telescope git commits"{} ]
      [ "<leader>gs" ":Telescope git_stash<CR>"   "Telescope git stash"{} ]
      [ "<leader>gS" ":Telescope git_status<CR>"  "Telescope git status"{} ]
      [ "<leader>gT" ":TodoTelescope<CR>"  "Telescope todo list"{} ]

      [ "<leader>fd" ":Yazi<CR>" "Yazi open"{} ]

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

    diagnostics = {
      enable = true;
      config = {
        update_in_insert = true;
        virtual_text = true;
      };
    };

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
    };

    # TODO: continue
    terminal.toggleterm = {
      enable = true;
      winbar.enabled = true;
    };

    autocomplete.blink-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    formatter.conform-nvim.enable = true;
    git.gitsigns.enable = true;
    lazy.enable = true;
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
