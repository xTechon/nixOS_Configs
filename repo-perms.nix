{ ... }:
# make sure /etc/nixos/* files can be edited by wheel group
{
  systemd.tmpfiles.settings = {
    "10-mypackage" = {
      "/etc/nixos" = {
        Z = {
          mode = "0775";
          user = "root";
          group = "wheel";
          age = "-";
        };
      };
    };
  };
}
