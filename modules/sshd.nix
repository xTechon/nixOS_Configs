{ ... }:
{
    services.openssh = {
        enable = true;
        ports = [ 960 ];
        allowSFTP = true;
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
            X11Forwarding = false;
        };
    };
    networking.firewall.allowedTCPPorts = [ 960 ];
}
