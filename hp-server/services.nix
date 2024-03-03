{ config, pkgs, ... }:

{
    services.gnome.gnome-settings-daemon.enable = true;
    xdg.portal.enable = true;
    xdg.portal.wlr.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    services.logind.lidSwitchExternalPower = "ignore";
    services.flatpak.enable = true;
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
    services.zerotierone = {
      enable = true;
      joinNetworks = [
        "NETWORK"
      ];
    };

    systemd.services = {
      "boot" = {
        enable = true;
        wants = [ "network-online.target" ];
        after = [ "network.target" "network-online.target" ];
        script = "/run/current-system/sw/bin/curl -H \"Title: Server boot\" -H \"Tags: warning\" -d \"HP-SERVER booted\" ntfy.sh/NFTYCHAN";
      };
      "spotdl-client" = {
        enable = true;
        wants = [ "network-online.target" ];
        after = [ "network.target" "network-online.target" ];
        script = "/run/current-system/sw/bin/spotdl web --host 0.0.0.0 --keep-alive";
        serviceConfig = {
          User = "builder";
          Group = "users";
          Restart = "on-failure";
        };
      };
      "spotify" = {
        enable = true;
        wants = [ "network-online.target" ];
        after = [ "network.target" "network-online.target" ];
        script = "/run/wrappers/bin/su - builder -c /home/builder/sway.sh";
        serviceConfig = {
          Restart = "on-failure";
        };
      };
      "minecraft" = {
        enable = true;
        wants = [ "network-online.target" ];
        after = ["network.target" "network-online.target" ];
        script = "/run/wrappers/bin/su - builder -c /home/builder/server/start.sh";
        serviceConfig = {
          Restart = "on-failure";
        };
      };
#      "mediamtx" = {
#        enable = true;
#        wants = [ "network-online.target" ];
#        after = [ "spotify.service" "network.target" "network-online.target" ];
#        script = "/run/wrappers/bin/su - builder -c /run/current-system/sw/bin/mediamtx";
#        serviceConfig = {
#         # Restart = "on-failure";
#        };
#      };
    };
}
