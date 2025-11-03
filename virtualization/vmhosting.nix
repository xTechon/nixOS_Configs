{ pkgs, ... }:
{

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "daniel" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  environment.systemPackages = [ pkgs.qemu ];
  services.qemuGuest.enable = true;

}
