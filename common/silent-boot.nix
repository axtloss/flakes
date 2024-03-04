{config, pkgs, ...}
{
  boot.loader.timeout = 0;
  boot.kernelParams = ["quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = 0;
  boot.initrd.systemd.enable = true;
  systemd.watchdog.rebootTime = "0";
  
}
