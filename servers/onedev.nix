{...}:
{
    virtualisation.oci-containers.containers.onedev = {
        image = "1dev/server";
        autoStart = true;
        ports = [
            "6610:6610"
            "6611:6611"
        ];
        volumes = [
            "/var/run/docker.sock:/var/run/docker.sock"
            "/var/docker/onedev:/opt/onedev"
        ];
        extraOptions = [
            "--restart=always"
        ];
        #environment = {
        #    INITIAL_USER = "svc-admin";
        #    INITIAL_PASSWORD = "12345"; # SET PASSWORD AFTER STARTUP!!!
        #    INITIAL_EMAIL = "danielhiromoto@outlook.com";
        #    INITIAL_SERVER_URL = "http://onedev.techLab.ddnsfree.com";
        #
        #};
    };
}
