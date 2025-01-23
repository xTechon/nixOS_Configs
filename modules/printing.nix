{ pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];

  # Enable scanning
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ (pkgs.epsonscan2.override { withNonFreePlugins = true; withGui = false; }) pkgs.utsushi ];


  # enable automatic discovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
