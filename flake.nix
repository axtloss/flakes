{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/release-22.05";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.4.0";
    nur.url = "github:nix-community/NUR";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager, nur, utils, stable, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      
      # Channel config
      channels.nixpkgs.input = nixpkgs;
      channelsConfig.allowUnfree = true;
      sharedOverlays = [
        nur.overlay
      ];

      hosts.nixowos5 = {
        system = "x86_64-linux";
        channelName = "nixpkgs";
        modules = [
          ./common/boot.nix
          ./common/gnome.nix
          #./kde.nix
          ./nitro5/hardware-configuration.nix
          ./nitro5/networking.nix
          ./nitro5/nvidia.nix
          ./common/packages.nix
          ./common/sound.nix
          ./common/users.nix
          ./common/virtualisation.nix
        ];
      };
      hosts.m4800 = {
        system = "x86_64-linux";
        channelName = "nixpkgs";
        modules = [
          ./common/boot.nix
          ./common/gnome.nix
          ./hardware-configuration.nix
          ./m4800/networking.nix
          ./common/packages.nix
          ./common/sound.nix
          ./common/users.nix
          ./common/virtualisation.nix
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
