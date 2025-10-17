{pkgs}: {
  enable = true;
  plugins = {
    "netrw.nvim" = {
      package = pkgs.vimPlugins.netrw-nvim;
      setupModule = "netrw";
      lazy = false;
    };
    "nvim-dev-container" = {
      setupModule = "devcontainer";
      package = pkgs.fetchFromGitHub {
        owner = "esensar";
        repo = "nvim-dev-container";
        hash = "sha256-ek/6/gBweO75JoVx9MQcnxeqkLvEDTKvGeQZnlDNCmc=";
        rev = "main";
      };
    };
      # {
      #   name = "swagger-preview.nvim";
      #   owner = "vinnymeller";
      #   branch = "main";
      #   hash = "sha256-o4jQMFjlQvWYUYsDYBcTRDxZemBOuDWe3ZyQm02yLm0=";
      #   cmd = "SwaggerPreview";
      # }
  
  }
}
