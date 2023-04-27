{ config, pkgs, ... }:

{
    nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
    };

    programs.fish.enable = true;
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        gnome.sushi
        lsd
        timeshift
        vim
        vscode
	openssl
	uutils-coreutils
	virt-manager
        gnomeExtensions.privacy-settings-menu
        gnomeExtensions.user-avatar-in-quick-settings
	quick-settings-tweaker
        python310Packages.python-lsp-server
    ];

    nixpkgs.overlays = [
      (
        self: super: {
          quick-settings-tweaker = super.gnomeExtensions.quick-settings-tweaker.overrideAttrs (
            old: rec {
              version = "cd8224ef1e797829ed9a2d42de10c0d9ca9ce2f4";
              src = super.fetchFromGitHub {
                owner = "kgdn";
                repo = "quick-settings-tweaks";
                rev = version;
                sha256 = "78e9w6FD49g9ejHepnCpWKLs6OywAlKZX8E0OXR1WPo=";
              };
             }
            );
          }
        )
    ];
    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.pinentryFlavor = "curses";
    programs.git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };
    services.fwupd.enable = true;
    services.flatpak.enable = true;
    services.zerotierone = {
      enable = true;
      joinNetworks = [
        "db64858fedfab7a1"
      ];
    };
    xdg.portal.enable = true;
}
