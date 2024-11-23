{ config, pkgs, ... }:

{

  # make sure containers user/group exists
  imports = [ "/etc/nixos/users/containers.nix" ];

  # make sure folders for volumes exist with permisions
  systemd.tmpfiles.rules = [
    "d /var/Containers/Gitea 0770 containers containers -"
    "d /var/Containers/GiteaDB 0750 containers containers -"
  ];

  # Gitea
  virtualisation.oci-containers.containers = {
    gitea = {
      autoStart = true;
      image = "gitea/gitea:latest";
      environment = {
        USER = "git";
        # from ../users/docker.nix
        USER_UID = "990";
        USER_GID = "990";
        GITEA__database__DB_TYPE = "postgres";
        GITEA__database__HOST = "db:5432";
        GITEA__database__NAME = "gitea";
        GITEA__database__USER = "gitea";
        GITEA__database__PASSWD = "gitea";
      };
      volumes = [
        "/var/Containers/Gitea:/data"
        "/etc/timezone:/etc/timezone:ro"
        "/etc/localtime:/etc/localtime:ro"
      ];
      ports = [
        "3000:3000"
        "222:22"
      ];
      dependsOn = [ "gitea-db" ];
    };
    gitea-db = {
      autoStart = true;
      image = "postgres:14";
      environment = {
        POSTGRES_USER = "gitea";
        POSTGRES_PASSWORD = "gitea";
        POSTGRES_DB = "gitea";
      };
      volumes = [
        "/var/Containers/GiteaDB:/var/lib/postgresql/data"
      ];
    };
  };
}
