{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ../../hardware/gpu/tiger-lake-gpu.nix
    ../../hardware/tpm.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-uuid/b8e398e0-2c23-4559-b54d-144cb0a2627c";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/705718e7-ae30-49c2-bda2-1a94b10deae4";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/31EB-DA9E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ {
      device = "/dev/disk/by-partuuid/e65bf003-9205-4f20-a732-ef7f7e629ca4";
      randomEncryption.enable = true;
    } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # --- laptop specific config with some changes ---
  # https://github.com/NixOS/nixos-hardware/blob/master/dell/xps/13-9310/default.nix

  # Includes the Wi-Fi and Bluetooth firmware for the QCA6390.
  hardware.enableRedistributableFirmware = true;

  # Requires at least 5.12 for working wi-fi and bluetooth.
  #boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "5.12") (lib.mkDefault pkgs.linuxPackages_latest);

  # Touchpad goes over i2c.
  # Without this we get errors in dmesg on boot and hangs when shutting down.
  boot.blacklistedKernelModules = [ "psmouse" ];

  # enable finger print sensor.
  # this has to be configured with `sudo fprintd-enroll <username>`.
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # Allows for updating firmware via `fwupdmgr`.
  services.fwupd.enable = true;

  # https://github.com/NixOS/nixos-hardware/blob/master/common/pc/laptop/default.nix
  services.tlp.enable = lib.mkDefault ((lib.versionOlder (lib.versions.majorMinor lib.version) "21.05")
                                       || !config.services.power-profiles-daemon.enable);

  # https://github.com/NixOS/nixos-hardware/blob/master/common/pc/ssd/default.nix
  services.fstrim.enable = lib.mkDefault true;
}
