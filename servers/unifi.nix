{...}:
{
  services.unifi = {
    enable = true;
    openFirewall = true;
  };
  networking.firewall.allowedTCPPorts = [
    8443 # allow remote login (web interface)
  ];
}