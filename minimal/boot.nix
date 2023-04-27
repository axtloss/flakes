{ lib, config, pkgs, ...}:

{
    boot = {
    # Use the systemd-boot EFI boot loader.
     loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
       efi.efiSysMountPoint = "/boot/efi";
     };
     postBootCommands = '' # Disable the NVIDIA gpu
       DEVS="0000:01:00.0 0000:01:00.1"
       for DEV in $DEVS; do
         echo "1" > /sys/bus/pci/devices/$DEV/remove
       done
     '';
    };
    services.xserver.videoDrivers = [ "i915" ];
    system.stateVersion = "22.05"; 
}
