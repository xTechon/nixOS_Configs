{ DOMAIN, ... }:
{
  services.unifi = {
    enable = true;
    openFirewall = true;
  };

  # open the port for the web interface
  networking.firewall.interfaces."lo".allowedTCPPorts = [
    8443
  ];

  # make a subdomain for the unifi web interface
  services.nginx.virtualHosts."unifi.${DOMAIN}" = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://localhost:8443/";
      proxyWebsockets = true;
    };
  };
}
