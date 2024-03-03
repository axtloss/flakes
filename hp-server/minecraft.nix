{ config, pkgs, ... }:

{
    services.minecraft-server={
        enable = true;
        jvmOpts = "-Xms4092M -Xmx4092M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10";
        eula = true;
        declarative = true;
        openFirewall = true;
        serverProperties = {
            server-port = 43000;
            difficulty = 3;
            gamemode = "survival";
            max-players = 7;
            motd = "silly goober server";
            white-list = false;
            enable-rcon = false;
            server-ip = "10.242.51.52";
        };
    };
}
