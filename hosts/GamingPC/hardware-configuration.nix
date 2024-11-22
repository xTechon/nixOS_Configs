# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/b0fcd062-0f6a-47fe-b6bf-bd913629704c";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2fd57c00-723c-4379-8d14-91b8072c6e7a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/E1B0-0975";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  environment.etc = {
    "crypttab" = {
      enable = true;
      text = ''
home UUID=338d6636-5f7a-448c-b2f2-eea109022648 /etc/luks-keys/home luks
      '';
    };
  };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/239268c2-7461-4c98-9f54-4aed2dd6aa84";
      fsType = "ext4";
    };

  fileSystems."/mnt/Windows_extra" = {
      device = "/dev/disk/by-uuid/662A2CC536A22B8B";
      fsType = "ntfs";
  };

  fileSystems."/mnt/Linux_extra" = {
      device = "/dev/disk/by-uuid/76fbbf1a-2113-47ab-94e6-1dc0af53dc04";
      fsType = "ext4";
  };

  swapDevices =
    [ {
      device = "/dev/mapper/vg0-swap";
      randomEncryption.enable = true;
    } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
