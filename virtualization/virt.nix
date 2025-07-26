# from: https://joshrosso.com/c/nix-k8s/
{ config, lib, pkgs, ... }:
{
  boot.kernelModules = [ "kvm-intel" "kvm-amd" ];

  # disable dhcpcd since we'll use systemd-networkd
  networking.useDHCP = lib.mkDefault false;

  # setup networking
  systemd.network = {
    enable = true;
    netdevs = {
      # Create the bridge interface
      "20-br0" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br0";
        };
      };
    };
    networks = {
      # TODO(you): update `30-enp2s0` to your NIC's interface (run `ifconfig`)
      # Connect the bridge ports to the bridge
      "30-enp2s0" = {
        # TODO(you): update `enp2s0` to your NIC's interface (run `ifconfig`)
        matchConfig.Name = "enp2s0";
        networkConfig.Bridge = "br0";
        linkConfig.RequiredForOnline = "enslaved";
      };
      "40-br0-dhcp" = {
        matchConfig.Name = "br0";
        networkConfig = {
          DHCP = "ipv4";
        };
      };
    };
  };

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.allowedBridges = [
    "br0"
  ];
  # required by libvirtd
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    prometheus
    prometheus-node-exporter
    prometheus-process-exporter

  ];

}
