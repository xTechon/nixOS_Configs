{ pkgs, ... }:
{
    programs.ssh = {
        startAgent = true;
        enableAskPassword = true;
        askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
    };
    environment.variables = {
        SSH_ASKPASS = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
        SSH_ASKPASS_REQUIRE = "prefer";
    };
}