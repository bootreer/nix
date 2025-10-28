{
  lib,
  config,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader.systemd-boot.enable = true;

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/ABB9-1AC4";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/57bb1091-8260-4509-b4e9-c294757817c3";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "discard=async"
      "compress-force=zstd"
    ];
  };

  boot.initrd.luks.devices."device-1".device =
    "/dev/disk/by-uuid/afaf2410-cbd7-4acb-8eea-ab05915c157d";
  boot.initrd.luks.devices."device-2".device =
    "/dev/disk/by-uuid/58d6bbe5-9101-4645-b1a5-7c51cfd30d91";

  fileSystems."/etc" = {
    device = "/dev/disk/by-uuid/57bb1091-8260-4509-b4e9-c294757817c3";
    fsType = "btrfs";
    options = [
      "subvol=etc"
      "discard=async"
      "compress-force=zstd"
    ];
  };

  fileSystems."/log" = {
    device = "/dev/disk/by-uuid/57bb1091-8260-4509-b4e9-c294757817c3";
    fsType = "btrfs";
    options = [
      "subvol=log"
      "discard=async"
      "compress-force=zstd"
    ];
  };

  fileSystems."/root" = {
    device = "/dev/disk/by-uuid/57bb1091-8260-4509-b4e9-c294757817c3";
    fsType = "btrfs";
    options = [
      "subvol=root"
      "discard=async"
      "compress-force=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/57bb1091-8260-4509-b4e9-c294757817c3";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "discard=async"
      "compress-force=zstd"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/620a745c-227e-4e46-8088-f27b2429aed4"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp7s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
