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
      #kdePackages.ksshaskpass
      plasma-panel-colorizer
      vscode-runner
      partitionmanager
      plasma-vault
      purpose # required for the share context menu in dolphin
    ];

  # make sure the firefox plasma integration works
  programs.firefox.nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  networking.networkmanager.plugins = with pkgs; [
    #networkmanager-fortisslvpn
    #networkmanager-iodine
    #networkmanager-l2tp
    networkmanager-openconnect
    networkmanager-openvpn
    #networkmanager-sstp
    #networkmanager-strongswan
    networkmanager-vpnc
  ];

}
