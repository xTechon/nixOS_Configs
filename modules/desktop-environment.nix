# plasma 6 desktop environment

{ pkgs, ... }:
{
    services.desktopManager.plasma6.enable = true;
    programs.kdeconnect.enable = true;

    environment.systemPackages =
    with pkgs;
    with kdePackages; [
        plasma-browser-integration
        kcalc
        krfb
        krdc
        mpc-qt
        ksshaskpass
        #kdeconnect-kde

        firefox
        discord
        spotube
    ];

    # make sure the firefox plasma integration works
    programs.firefox.nativeMessagingHosts.packages = [pkgs.kdePackages.plasma-browser-integration];

}
