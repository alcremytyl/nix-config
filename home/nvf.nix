# https://notashelf.github.io/nvf/index.xhtml
let 
  bindgen = import ../lib/nvim-bindgen.nix;
in {
  enable = true;

  settings.vim = {
    options.tabstop = 2;
    options.shiftwidth = 2;
    options.expandtab = true;

    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };

    languages = {
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
    };

    keymaps = [
      (bindgen "<leader>gc" ":Telescope git_commits<CR>" "Telescope git commits"{})
      (bindgen "<leader>gs" ":Telescope git_stash<CR>" "Telescope git stash"{})
      (bindgen "<leader>gS" ":Telescope git_status<CR>" "Telescope git status"{})
      (bindgen "<leader>q" ":q<CR>" "Quit file"{})
      (bindgen "<leader>w" ":w<CR>" "Save file"{})
      (bindgen "<leader>wq" ":wq<CR>" "Save and quit"{})
      (bindgen "<leader>ch" ":Cheatsheet<CR>" "Cheatsheet"{}) # TODO: migrate to NvChad's 

    ];

    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    binds.cheatsheet.enable = true;
    binds.whichKey.enable = true;
    clipboard.enable = true;
    formatter.conform-nvim.enable = true;
    git.gitsigns.enable = true;
    lsp.enable = true;
    lsp.trouble.enable = true;
    notes.todo-comments.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    terminal.toggleterm.enable = true;
    ui.colorizer.enable = true;
    ui.nvim-ufo.enable = true;
    utility.surround.enable = true;
    visuals.indent-blankline.enable = true;
  };
}
