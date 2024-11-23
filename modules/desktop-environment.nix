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
      ksshaskpass
      #kdeconnect-kde

    ];

  # make sure the firefox plasma integration works
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

}
