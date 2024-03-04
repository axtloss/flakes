{ config, lib, pkgs, ... }:

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
        lsd
        vim
	openssl
	virt-manager
        cargo
        spicetify-cli
        syncthingtray
        profanity
        gomuks
        gammastep
        sbctl
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
    
    services.emacs = {
      enable = true;
      defaultEditor = true;
      package = pkgs.emacs-gtk;
    };

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];

    xdg.portal.enable = true;
}
