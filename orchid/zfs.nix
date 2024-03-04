{ config, ... }:

{
	boot.supportedFilesystems = [ "zfs" ];
	networking.hostId = "8E4FFF90";
	boot.initrd.luks.devices = {
		root = {
			device = "/dev/disk/by-label/ROOT";
			preLVM = true;
		};
	};

}
