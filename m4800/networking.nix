{ config, ... }:

{
    networking.hostName = "m4800"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

   networking.extraHosts = "0.0.0.0 phoronix.com"

    # Set your time zone.
    time.timeZone = "Europe/Berlin";
}
