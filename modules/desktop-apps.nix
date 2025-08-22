# general packages to be installed independent of DE
{ pkgs, ... }:
{
  /*
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11" # required for logseq
  ];*/

  environment.systemPackages =
    with pkgs; [

      discord
      spotube
      haruna
      #logseq
      qbittorrent
      zoom-us
      _1password-gui
      _1password-cli
    ];
}
