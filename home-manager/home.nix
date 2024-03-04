{ config, pkgs, ... }:
{
  home.username = "xen";
  home.homeDirectory = "/home/xen";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
