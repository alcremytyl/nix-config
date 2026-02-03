# https://notashelf.github.io/nvf/index.xhtml
{ config, lib, pkgs, ...}:
{
  #imports = [./keybinds.nix];

  programs.nvf = {
    enable = true;
    

    settings.vim = {
      # lazy = import ./lazy.nix{inherit pkgs nvf;};

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
        clang.enable = true;
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

      keymaps =  import ./keybinds.nix;
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
  };
}
