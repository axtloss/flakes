{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/release-23.11";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.4.0";
    nur.url = "github:nix-community/NUR";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager, lanzaboote, nix-flatpak, nur, utils, stable, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      
      # Channel config
      channels.nixpkgs.input = nixpkgs;
      channelsConfig.allowUnfree = true;
      sharedOverlays = [
        nur.overlay
      ];

      hosts.orchid = {
        system = "x86_64-linux";
        channelName = "nixpkgs";
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          lanzaboote.nixosModules.lanzaboote
          home-manager.nixosModules.home-manager
          ./common/boot.nix
          #./common/gnome.nix
          #./common/kde.nix
          ./common/silent-boot.nix
          ./common/vaapi.nix
          ./common/flatpak.nix
          ./common/sway.nix
          ./common/syncthing.nix
          ./orchid/hardware-configuration.nix
          ./orchid/networking.nix
          ./orchid/nvidia.nix
	        ./orchid/zfs.nix
          ./common/packages.nix
          ./common/sound.nix
          ./common/users.nix
          ./common/virtualisation.nix
          ./home-manager/home.nix
        ];
      };
      hosts.cherryblossom = {
        system = "x86_64-linux";
        channelName = "nixpkgs";
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          #lanzaboote.nixosModule.lanzaboote
          home-manager.nixosModules.home-manager
          ./common/boot.nix
          ./common/silent-boot.nix
          ./common/vaapi.nix
          ./common/flatpak.nix
          ./common/sway.nix
          ./common/syncthing.nix
          ./cherryblossom/hadware-configuration.nix
          ./cherryblossom/networking.nix
          ./cherryblossom/nvidia.nix
          ./cherryblossom/zfs.nix
          ./common/packages.nix
          ./common/sound.nix
          ./common/users.nix
          ./common/virtualisation.nix
          ./home-manager/home.nix
        ];
      };
      hosts.superminimal5 = {
         system = "x86_64-linux";
         channelName = "nixpkgs";
         modules = [
           ./hardware-configuration.nix
           ./minimal/boot.nix
           ./minimal/gui.nix
           ./minimal/networking.nix
           ./minimal/packages.nix
           ./minimal/podman.nix
           ./common/users.nix
         ];
      };
      hosts.hp-server = {
         system = "x86_64-linux";
         channelName = "nixpkgs";
         modules = [
           ./hardware-configuration.nix
           ./hp-server/boot.nix
           ./hp-server/networking.nix
           ./hp-server/services.nix
           ./hp-server/packages.nix
           ./hp-server/users.nix
           ./hp-server/nfs.nix
           ./hp-server/syncthing.nix
           ./hp-server/virtualisation.nix
           ./hp-server/timers.nix
           #./hp-server/minecraft.nix
           ./common/sound.nix
         ];
      };
    };
}
