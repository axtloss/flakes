{ config, pkgs, ... }:

{
    users.users.xen = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
        packages = with pkgs; [
        #     thunderbird
        ];
    };
}
