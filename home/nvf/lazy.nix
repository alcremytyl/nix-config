{pkgs}: {
  enable = true;
  plugins = {
    "netrw.nvim" = {
      package = pkgs.vimPlugins.netrw-nvim;
      setupModule = "netrw";
      lazy = false;
    };
    "devcontainer" = {
      setupModule = "devcontainer";
      package = pkgs.vimUtils.buildVimPlugin {
        version = "main";
        pname = "devcontainer";
        src = pkgs.fetchFromGitHub {
          owner = "esensar";
          repo = "nvim-dev-container";
          hash = "sha256-+cKryzHutDKJ3cOkrwgILH4meHwWjt93jJkEkt3tzJg=";
          rev = "main";
        };
      };
    };
    "swagger-preview" = {
      cmd = "SwaggerPreview";
      setupModule = "swagger-preview";
      package = pkgs.vimUtils.buildVimPlugin {
        version = "main";
        pname = "swagger-preview";
        src = pkgs.fetchFromGitHub {
          repo = "swagger-preview.nvim";
          owner = "vinnymeller";
          rev = "main";
          hash = "sha256-o4jQMFjlQvWYUYsDYBcTRDxZemBOuDWe3ZyQm02yLm0=";
        };
      };
    };
  };
}


# package = pkgs.vimUtils.buildVimPlugin {
  # pname = pname;
  # version = branch;
    # src = pkgs.fetchFromGitHub {
    # owner = plugin.owner;
    # repo = repo;
    # rev = branch;
    # hash = hash;
    # };
  # };
