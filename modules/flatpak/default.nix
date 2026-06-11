{...}: {
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "com.parsecgaming.parsec"
      "it.mijorus.gearlever"
      # "org.prismlauncher.PrismLauncher"
    ];
  };
}
