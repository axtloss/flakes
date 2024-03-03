{ config, pkgs, ... }:

{
    nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        vim
	openssl
        spotdl
        waypipe
        wayvnc
        kitty
        ffmpeg
        mediamtx
        xdg-utils
        glib
        openjdk17-bootstrap
	screen
    ];

    services.dbus.enable = true;
    programs.sway.enable = true;
    programs.sway.wrapperFeatures.gtk = true;
    services.gnome.core-utilities.enable = true;
    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.pinentryFlavor = "curses";
}
