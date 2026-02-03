{pkgs, nvf}: {
  enable = true;
  plugins = {
    # "netrw.nvim" = {
    #   package = pkgs.vimPlugins.netrw-nvim;
    #   setupModule = "netrw";
    #   lazy = false;
    # };
    # "devcontainer" = {
    #   setupModule = "devcontainer";
    #   package = pkgs.vimUtils.buildVimPlugin {
    #     version = "main";
    #     pname = "devcontainer";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "esensar";
    #       repo = "nvim-dev-container";
    #       # hash = "sha256-+cKryzHutDKJ3cOkrwgILH4meHwWjt93jJkEkt3tzJg=";
    #       hash = "sha256-N2m4AxjvcBlnkkfujdoHx/QJpoA/BYOg/DWY7X8TQgI=";
    #       rev = "main";
    #     };
    #   };
    # };
    # can't install dependency
    # "swagger-preview" = {
    #   # build = "npm i";
    #   cmd = "SwaggerPreview";
    #   setupModule = "swagger-preview";
    #   package = pkgs.vimUtils.buildVimPlugin {
    #     version = "main";
    #     pname = "swagger-preview";
    #     src = pkgs.fetchFromGitHub {
    #       repo = "swagger-preview.nvim";
    #       owner = "vinnymeller";
    #       rev = "main";
    #       hash = "sha256-o4jQMFjlQvWYUYsDYBcTRDxZemBOuDWe3ZyQm02yLm0=";
    #     };
    #   };
    # };
    # doesn't build, wait for them to fix
    # "rest-nvim" = {
    #   setupModule = "rest-nvim";
    #   package = pkgs.vimUtils.buildVimPlugin {
    #     version = "main";
    #     pname = "rest-nvim";
    #     src = pkgs.fetchFromGitHub {
    #       repo = "rest.nvim";
    #       owner = "rest-nvim";
    #       rev = "main";
    #       hash = "sha256-BeHFGi8QPNJZwDbW7mI7hrakQGfIolnOiYYxcr2jNLU=";
    #     };
    #   };
    # };
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
