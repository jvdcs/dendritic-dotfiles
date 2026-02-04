{
  flake.modules.nixos.feature-bluetooth = {pkgs, ...}: {
    environment.systemPackages = [pkgs.bluez];
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true; # battery level reporting
          FastConnectable = true; # faster pairing (uses more power)
          ControllerMode = "bredr"; # uncomment if BT audio dropouts occur
        };
        Policy = {
          AutoEnable = true; # auto-enable adapters when found
        };
      };
    };
  };
}
