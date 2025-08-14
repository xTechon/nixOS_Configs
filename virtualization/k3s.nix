# from: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/cluster/k3s/docs/USAGE.md
{ pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];
  services.etcd.enable = true;
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      # "--debug" # Optionally add additional args to k3s
      "--embedded-registry"
      "--disable metrics-server"
    ];
  };
}
