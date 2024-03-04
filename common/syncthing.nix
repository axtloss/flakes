{ config, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    user = "xen";
    configDir = "/home/xen/.config/syncthing";
    guiAddress = "127.0.0.1:8384";
  };
}
