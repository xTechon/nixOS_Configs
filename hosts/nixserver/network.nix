# from: https://joshrosso.com/c/nix-k8s/
{ config, pkgs, ... }:
{
  networking.hostName = "nixserver-master"; # Define your hostname.
  networking.useDHCP = false;
  
  systemd.network.enable = true;

  networking.firewall.enable = false;
  
  systemd.network.networks = {
      "10-eno1" = {
        # TODO(you): update `enp2s0` to your NIC's interface (run `ifconfig`)
        matchConfig.Name = "eno1";
        address = [
          "192.168.1.10/24"
        ];
        routes = [
          { Gateway = "192.168.1.1"; }
        ];
      };
      
      /*
      "20-br0" = {
        netdevConfig = {
          Kind = "bridge";
          Name = "br0";
        };
      };
      */
  };
  
}
