{ pkgs, config, ... }:
let
 dbus-sway-environment = pkgs.writeTextFile {
      name = "dbus-sway-environment";
      destination = "/usr/bin/sway-env";
      executable = true;
      text = ''
        dbus-update-activation-enviroment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
        systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
        systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      '';
    };

in
{
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        #useXkbConfig = true; # use xkbOptions in tty.
        keyMap = "colemak";
    };
    environment.systemPackages = with pkgs; [
      dbus-sway-environment
      sway-contrib.grimshot
      foot
      wl-clipboard
      fuzzel
      xdg-utils
      playerctl
      waybar
      brightnessctl
      mako
    ];

    services.gnome.core-utilities.enable = true;
    services.gnome.sushi.enable = true;
    services.gnome.tracker.enable = true;
    services.gnome.tracker-miners.enable = true;
    programs.light.brightnessKeys.enable = true;
    programs.kdeconnect.enable = true;
    services.gnome.core-os-services.enable = true;
    services.gnome.gnome-keyring.enable = true;
    programs.file-roller.enable = true;

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
#      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
      extraSessionCommands = ''
	  # SDL:
	  export SDL_VIDEODRIVER=wayland
	  # QT (needs qt5.qtwayland in systemPackages):
	  export QT_QPA_PLATFORM=wayland-egl
	  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
	  # Fix for some Java AWT applications (e.g. Android Studio),
	  # use this if they aren't displayed properly:
	  export _JAVA_AWT_WM_NONREPARENTING=1
	'';
      extraOptions = ["--unsupported-gpu"];
    };

}
