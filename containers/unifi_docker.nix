{ DOMAIN, lib, config, ... }:
{
  # make sure containers user/group exists
  imports = [ "../users/containers.nix" ];

  # make sure folders for volumes exist with permissions
  systemd.tmpfiles.rules = [
    "d /var/Containers/unifi/unifi-network-application 0770 containers containers -"
    "d /var/Containers/unifi/unifi-db 0750 containers containers -"
  ];

  # unifi network application
  # converted from: https://github.com/GiuseppeGalilei/Unifi-Network-Application/blob/main/OneLiner/docker-compose.yml
  virtualisation.oci-containers.containers = {
    unifi-network-application = {
      autoStart = true;
      image = "lscr.io/linuxserver/unifi-network-application:latest";
      environment = {
        MONGO_DBNAME = "unifi-db";
        MONGO_HOST = "unifi-db";
        MONGO_PASS = "unifi-db";
        MONGO_PORT = "27017";
        MONGO_USER = "unifi";
        PGID = "1000";
        PUID = "1000";
        TZ = "Etc/UTC";
      };
      volumes = [
        "/var/Containers/unifi-network-application:/config:rw"
      ];
      ports = [
        "8443:8443/tcp"
        "3478:3478/udp"
        "10001:10001/udp"
        "8080:8080/tcp"
        "1900:1900/udp"
        "8843:8843/tcp"
        "8880:8880/tcp"
        "6789:6789/tcp"
        "5514:5514/udp"
      ];
      log-driver = "journald";
      /*
      extraOptions = [
        "--network-alias=unifi-network-application"
        "--network=unifi-network-application_unifi-bridge"
      ];
      */
      dependsOn = [ "unifi-db" ];
    };
    unifi-db = {
      autoStart = true;
      image = "docker.io/mongo:3.6";
      environment = {
        "PGID" = "1000";
        "PUID" = "1000";
        "TZ" = "Etc/UTC";
      };
      volumes = [
        "/var/Containers/unifi/init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js:rw"
        "/var/Containers/unifi/unifi-db:/data/db:rw"
      ];
      ports = [
        "27017:27017/tcp"
      ];
      log-driver = "journald";
    };
  };

  # open ports for the container
  networking.firewall.allowedTCPPorts = [
    "8080"
    "8843"
    "8880"
    "6789"
  ];
  networking.firewall.allowedUDPPorts = [
    "3478"
    "10001"
    "1900"
    "5514"
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
