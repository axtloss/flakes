{ config, lib, pkgs, ... }:

{
    services.flatpak.enable = true;
    services.flatpak.remotes = lib.mkOptionDefault [{
      name="flathub-beta"; location="https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];

    services.flatpak.uninstallUnmanagedPackages = true;
    services.flatpak.update.onActivation = true;
    services.flatpak.update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };


    services.flatpak.packages = [
      "dev.vencord.Vesktop"
      "com.spotify.Client"
      "one.ablaze.floorp"
      "com.mattjakeman.ExtensionManager"
      "org.signal.Signal"
    ];

    services.flatpak.overrides = {
      global = {
        Context.sockets = ["wayland"];
        Environment = {
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        };
      };
      "one.ablaze.floorp" = {
        Environment = {
          MOZ_ENABLE_WAYLAND = "1";
        };
      };
      "dev.vencord.Vesktop".Context = {
        filesystems = [
          "/home/xen/Documents/Pictures:ro"
        ];
      };
    };

    system.fsPackages = [ pkgs.bindfs ];
    fileSystems = let
      mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
      };
      aggregatedIcons = pkgs.buildEnv {
        name = "system-icons";
        paths = with pkgs; [
          gnome.gnome-themes-extra # for gnome
        ];
        pathsToLink = [ "/share/icons" ];
      };
      aggregatedFonts = pkgs.buildEnv {
        name = "system-fonts";
        paths = config.fonts.packages;
        pathsToLink = [ "/share/fonts" ];
      };
    in {
      "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
      "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
    };

    fonts = {
      fontDir.enable = true;
      packages = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        noto-fonts-cjk
      ];
    };

    environment.sessionVariables = {
      XDG_CONFIG_HOME = "$HOME/.config";
    };
}
