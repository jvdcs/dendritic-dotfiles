{
  flake.modules.nixos.device-ASUS_Zenbook_14_UX3405MA = {
    modulesPath,
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "uas" "sd_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/5406f0c6-4e69-4bfc-9a09-35a00d63c111";
      fsType = "ext4";
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/6d3d6195-f5ba-454b-adc3-319ad0f7658e";
      fsType = "ext4";
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/2227fe24-e533-4b7f-87c1-a33b54319bbb";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/9265-6582";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/6e598378-d19a-4ce0-87cc-0380f4947517";}
    ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    hardware = {
      enableAllFirmware = true;
      enableAllHardware = true;
      graphics.enable = true;
      graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        intel-compute-runtime
        vpl-gpu-rt
        vaapi-intel-hybrid
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      graphics.enable32Bit = true;
      graphics.extraPackages32 = with pkgs.driversi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };

    # https://wiki.nixos.org/wiki/Intel_Graphics
    boot.kernelParams = ["i915.force_probe=7d55"];
  };
}
