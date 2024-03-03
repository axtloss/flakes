{ config, pkgs, ... }:

{
  systemd.timers= {
    "spotdl" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 03:00:00";
        Unit = "spotdl.service";
      };
    };
  };


  systemd.services."spotdl" = {
    script = ''
      export PATH=/run/wrappers/bin:/home/builder/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/home/builder/.nix-profile/bin:/etc/profiles/per-user/builder/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin
      cd /home/builder/Music
      spotdl 'https://open.spotify.com/playlist/7AyFf4z1kOohOXURtU344g?si=89ac1773ce1443eb'
      echo "Completed on: $(date)" >> /home/builder/spotdllog
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "builder";
    };
  };
}
