{ config, pkgs, ... }:

{
  # used to control access to docker volumes
  users.groups.containers = {
    gid = 990;
  };


  users.users.containers = {
    isSystemUser = true;
    isNormalUser = false;
    uid = 990;

    group = "containers";
  };
}
