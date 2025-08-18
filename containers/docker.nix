# from: https://wiki.nixos.org/wiki/Docker
{ ... }:
{

  # make sure folder exists for new docker data root
  systemd.tmpfiles.rules = [
    "d /var/Containers/Docker 0770 containers containers -"
  ];

  virtualisation.docker = {
    # Consider disabling the system wide Docker daemon
    enable = false;
    autoPrune.enable = true;

    rootless = {
      enable = true;
      userland-proxy = false;
      setSocketVariable = true;
      # Optionally customize rootless Docker daemon settings
      daemon.settings = {
        data-root = "/var/Containers/Docker";
        dns = [ "1.1.1.1" "8.8.8.8" ];
        registry-mirrors = [ "https://mirror.gcr.io" ];
      };
    };
  };
}
