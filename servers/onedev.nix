{...}:
{
  # make sure containers user/group exists
  imports = [ "/etc/nixos/users/containers.nix" ];

  # make sure folders for volumes exist with permisions
  systemd.tmpfiles.rules = [
    "d /var/Containers/onedev 0770 containers containers -"
  ];
    config.virtualisation.oci-containers.containers.onedev = {
        image = "1dev/server";
        autoStart = true;
        ports = [
            "6610:6610"
            "6611:6611"
        ];
        volumes = [
            "/var/run/docker.sock:/var/run/docker.sock"
            "/var/Containers/onedev:/opt/onedev"
        ];
        #extraOptions = [
        #    "--restart=always"
        #];
        #environment = {
        #    INITIAL_USER = "svc-admin";
        #    INITIAL_PASSWORD = "12345"; # SET PASSWORD AFTER STARTUP!!!
        #    INITIAL_EMAIL = "danielhiromoto@outlook.com";
        #    INITIAL_SERVER_URL = "http://onedev.techLab.ddnsfree.com";
        #
        #};
    };
}
