{...}: {
  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "com.parsecgaming.parsec"
    ];
  };
}
