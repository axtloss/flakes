{ pkgs, config, ... }:

{
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        #useXkbConfig = true; # use xkbOptions in tty.
        keyMap = "colemak";
    };

    services.xserver = {
        enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
        xkb.layout = "us";
    };
}
