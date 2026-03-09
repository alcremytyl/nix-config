{ pkgs, ... }:{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "floorp.desktop";
      "text/html" = "floorp.desktop";
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      #      xdg-desktop-portal-kde
      #      xdg-desktop-portal-gtk
    ];
  };
}
