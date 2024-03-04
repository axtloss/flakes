{ pkgs, config, ... }:

{
  boot.plymouth = {
    enable = true;
    boot.plymouth.logo = "/home/xen/plymouth.jpg";
  };
}
