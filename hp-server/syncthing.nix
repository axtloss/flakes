{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "builder";
    dataDir = "/home/builder/Documents";
    configDir = "/home/builder/.config/syncthing";
    guiAddress = "192.168.2.167:8384";
  };
}
