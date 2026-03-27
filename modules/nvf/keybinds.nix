{  ... }:
let
  # yeah man
  # https://github.com/NotAShelf/nvf/blob/main/lib/binds.nix
  mkKeymap = mode: key: action: opt: opt // {inherit mode key action;};
in {
  programs.nvf.settings.vim.keymaps = [
    (mkKeymap "n" "<Esc>" "<cmd>noh<CR>" {desc = "Clear highlights [General]";})

    (mkKeymap "n" "<leader>fT" "<cmd>TodoTelescope<CR>" {desc = "To-Do [Telescope]";})

    (mkKeymap "n" "<leader>q"  "<cmd>q<CR>"  {desc = "Quit [File]";})
    (mkKeymap "n" "<leader>w"  "<cmd>w<CR>"  {desc = "Save [File]";})
    (mkKeymap "n" "<leader>wq" "<cmd>wq<CR>" {desc = "Save Quit [File]";})

    (mkKeymap "n" "<leader>b" "<cmd>enew<CR>" {desc = "new [Buffer]";})
    (mkKeymap "n" "<leader>x" "<cmd>bd<CR>"   {desc = "close [Buffer]";})

    (mkKeymap "n" "<leader>ch" "<cmd>Cheatsheet<CR>" {desc = "Cheatsheet";}) 

    (mkKeymap "n" "<leader>v" "<cmd>ToggleTerm direction=vertical<CR>"   {desc = "vertical [Terminal]";})
    (mkKeymap "n" "<leader>h" "<cmd>ToggleTerm direction=horizontal<CR>" {desc = "horizontal [Terminal]";})
    (mkKeymap "t" "<C-x>"     "<C-\\><C-N>" {desc = "escape [Terminal]";})
  ];
}
