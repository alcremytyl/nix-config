# https://notashelf.github.io/nvf/index.xhtml
let 
  bindgen = import ./lib/nvim-bindgen.nix;
in {
  enable = true;

  settings.vim = {
      theme = {
        enable = true;
        name = "tokyonight";
        style = "night";
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;

        nix.enable = true;
        rust.enable = true;
      };

      keymaps = [
        (bindgen "<leader>gc" ":Telescope git_commits" "Telescope git commits"{})
                        # { key = "<leader>wq"; mode = ["n"]; action = ":wq<CR>"; silent = true; description = "Save and quit file"; }
                        # { key = "<leader>w"; mode = ["n"]; action = ":w<CR>"; silent = true; description = "Save file"; }
                        # { key = "<leader>q"; mode = ["n"]; action = ":q<CR>"; silent = true; description = "Quit file"; }
      ];

      autocomplete.nvim-cmp.enable = true;
      clipboard.enable = true;
      statusline.lualine.enable = true;
      telescope.enable = true;
      ui.nvim-ufo.enable = true;
      utility.surround.enable = true;
  };
}
