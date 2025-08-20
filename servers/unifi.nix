{ DOMAIN, ... }:
{
  services.unifi = {
    enable = true;
    openFirewall = true;
  };

  # open the port for the web interface
  networking.firewall."lo".allowedTCPPorts = [
    8443
  ];

  # make a subdomain for the unifi web interface
  services.nginx.virtualHosts."unifi.${DOMAIN}" = {
    enableACME = false;
    forceSSL = false;
    locations."/" = {
      proxyPass = "http://localhost:8443/";
    };
  };
}
