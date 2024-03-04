{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./waybar.nix
  ];

  home.username = "xen";
  home.homeDirectory = "/home/xen";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    mpv
  ];

  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main.show-actions = "yes";
    colors.background = "DDB6F2B2";
  };

  programs.home-manager.enable = true;
}
