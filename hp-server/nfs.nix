{ config, pkgs, ... }:

{
  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    exports = ''
    /Projects 192.168.2.118(rw,fsid=0,insecure,sync,no_subtree_check,crossmnt) 192.168.2.127(rw,fsid=0,insecure,sync,no_subtree_check,crossmnt)
    '';
  };
}
