{ config, pkgs, ... }:

{
  services.vsftpd = {
    enable = true;
    localRoot = "/home/builder/Documents/Stuff";
    userlist = [ "builder" ];
    localUsers = true;
    userlistEnable = true;
    writeEnable = true;
    extraConfig = "pasv_min_port=56250\npasv_max_port=56260";
  };
}
