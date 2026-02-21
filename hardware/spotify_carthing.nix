{ pkgs, ... }:
{
  environment.systemPackages =
    with pkgs; [

      (pkgs.callPackage ../Extra_pkgs/deskthing.nix { })
      libusb1 # to connect to the carthing
      libusb-compat-0_1
    ];

  # extra udev rule to flash deskthing with new image on chromium: https://terbium.app/
  # see docs: https://carthing.wiki/first-steps/flashing/
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="1b8e", ATTRS{idProduct}=="c003", MODE="0666"
  '';

}
