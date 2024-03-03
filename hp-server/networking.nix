{ config, ... }:

{
    networking.hostName = "hp-server"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    networking.extraHosts = "0.0.0.0 phoronix.com";
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [ 53 111 2049 4000 4001 4002 20048 25565 8800 8384 22000 8000 5900 8554 ];
    networking.firewall.allowedUDPPorts = [ 53 111 2049 4000 4001 4002 20048 25565 22000 21027 8384 8000 5900 8554 ];
 
    services.dnscrypt-proxy2 = {
      
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        #sources.quad9-resolvers = {
        #   urls = [
        #     "https://quad9.net/dnscrypt/quad9-resolvers.md"
        #     "https://raw.githubusercontent.com/Quad9DNS/dnscrypt-settings/main/dnscrypt/quad9-resolvers.md"
        #   ];
        #   cache_file = "/var/lib/dnscrypt-proxy2/quad0-resolvers.md";
        #   minisign_key = "RWQBphd2+f6eiAqBsvDZEBXBGHQBJfeG6G+wJPPKxCZMoEQYpmoysKUN";
        #   refresh_delay = 72;
        #   prefix = "quad9-";
        #};
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };
        listen_addresses = ["192.168.2.167:53" "127.0.0.1:53"];
      };
    };
     
    systemd.services.dnscrypt-proxy2.serviceConfig = {
      StateDirectory = "dnscrypt-proxy";
    };

    # Set your time zone.
    time.timeZone = "Europe/Berlin";
}
