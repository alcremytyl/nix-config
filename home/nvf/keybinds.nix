{ config, lib, options, ... }:
let
  inherit (lib.nvim.binds) mkKeymap;
  cfg = config.vim.plugin;
  keys = cfg.mappings;
  inherit (options.vim.lsp.trouble) mappings;
in {
  programs.nvf.settings.vim.keymaps = [

    # (mkKeymap "n" keys.workspaceDiagnostics "Trouble toggle diagnostics" {desc = mappings.workspaceDiagnostics.description;})   

    (mkKeymap "n" "<Esc>" ":noh<CR>" { desc = "General clear highlights";} )

    (mkKeymap "n" "<leader>gc" ":Telescope git_commits<CR>" {desc = "Telescope git commits";})
    (mkKeymap "n" "<leader>gs" ":Telescope git_stash<CR>"   {desc = "Telescope git stash";})
    (mkKeymap "n" "<leader>gS" ":Telescope git_status<CR>"  {desc = "Telescope git status";})
    (mkKeymap "n" "<leader>gT" ":TodoTelescope<CR>"         {desc = "Telescope todo list";})

        # (mkKeymap "n" "<leader>fd" ":Yazi<CR>" {desc = "Yazi open";})

    (mkKeymap "n" "<leader>q"  ":q<CR>"  {desc = "Quit file";})
    (mkKeymap "n" "<leader>w"  ":w<CR>"  {desc = "Save file";})
    (mkKeymap "n" "<leader>wq" ":wq<CR>" {desc = "Save and quit";})

        # (mkKeymap "n" "<leader>ch" ":Cheatsheet<CR>" {desc = "Cheatsheet";}) 

    (mkKeymap "n" "<leader>b" ":enew<CR>" {desc = "Buffer new";})
    (mkKeymap "n" "<leader>x" ":bd<CR>"   {desc = "Buffer close";})

    (mkKeymap "n" "<leader>v" ":ToggleTerm direction=vertical<CR>"   {desc = "Terminal vertical";})
    (mkKeymap "n" "<leader>h" ":ToggleTerm direction=horizontal<CR>" {desc = "Terminal horizontal";})
    (mkKeymap "t" "<C-x>" "<C-\\><C-N>" {desc = "Terminal escape";})

  ];
}
