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
        browsh
        lynx
        vlock
        vim
	openssl
        tmux
        musikcube
        gomuks
        python310Packages.python-lsp-server
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
    services.gpm.enable = true;
    services.flatpak.enable = true;
    services.tlp = {
      enable = true;

    };
    services.zerotierone = {
      enable = true;
      joinNetworks = [
        "db64858fedfab7a1"
      ];
    };
    xdg.portal.enable = true;
}
