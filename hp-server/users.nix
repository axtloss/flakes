{ config, pkgs, ... }:

{
    users.users.builder = {
        isNormalUser = true;
        extraGroups = [ "audio" "wheel" ];
#        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        #shell = pkgs.fish;
        #packages = with pkgs; [
        #     thunderbird
        #];
    };
}
